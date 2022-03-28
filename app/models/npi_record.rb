class NpiRecord < ApplicationRecord
  serialize :other_names, Array

  # TODO: can I fix it so I can validate on create?
  validates :enumeration_type, :number, :ordinal_position, presence: true, on: :update
  validates_length_of :number, is: 10,  message: 'NPI Record must be 10 digit long'

  has_many :addresses, dependent: :destroy
  has_many :endpoints, dependent: :destroy
  has_many :identifiers, dependent: :destroy
  has_many :taxonomies, dependent: :destroy

  has_one :basic_datum, dependent: :destroy

  def find_by_number(number)
    transaction do
      record =
        self.class.where(number: number).exists? ? find_by(number: number) : fetch_record_from_api(number)
      record.ordinal_position = self.class.maximum('ordinal_position') + 1
      record.save!
    end
  end

  private

  def fetch_record_from_api(number)
    construct_npi_record(
      number, Faraday.get("https://npiregistry.cms.hhs.gov/api/?version=2.0&number=#{number}").body
    )
  end

  def set_result(api_body)
    @result ||= api_body[:results].first
  end

  def construct_npi_record(number, api_body)
    api_body = JSON.parse api_body
    api_body = api_body.deep_symbolize_keys
    set_result(api_body)

    self.enumeration_type = @result[:enumeration_type]
    self.last_updated_epoch = @result[:last_updated_epoch]
    self.created_epoch = @result[:created_epoch]
    self.other_names = @result[:other_names]

    if @result[:number] == number
      self.number = number
    else
      raise("Entered number and NPI number from API don't match")
    end

    save!

    create_addresses
    create_basic_datum
    create_taxonomies
    create_identifiers
    create_endpoints

    self
  end

  def create_addresses
    return if @result[:addresses].blank?

    @result[:addresses].each do |address_hash|
      Address.create!(address_hash.merge(npi_record: self))
    end
  end

  def create_basic_datum
    return if @result[:basic].blank?

    BasicDatum.create!(@result[:basic].merge(npi_record: self))
  end

  def create_taxonomies
    return if @result[:taxonomies].blank?

    @result[:taxonomies].each do |taxonomy_hash|
      Taxonomy.create!(taxonomy_hash.merge(npi_record: self))
    end
  end

  def create_identifiers
    return if @result[:identifiers].blank?

    @result[:identifiers].each do |identifier_hash|
      Identifier.create!(identifier_hash.merge(npi_record: self))
    end
  end

  def create_endpoints
    return if @result[:endpoints].blank?

    @result[:endpoints].each do |endpoint_hash|
      Endpoint.create!(endpoint_hash.merge(npi_record: self))
    end
  end
end
