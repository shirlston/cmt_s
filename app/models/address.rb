class Address < ApplicationRecord
  validates :address_1, :city, :state, :postal_code, presence: true
  validates :address_purpose, presence: true

  validate :validate_address_purpose

  belongs_to :npi_record

  def to_s
    formatted_postal_code = "#{postal_code.first(5)}-#{postal_code.last(4)}" if postal_code.size == 9

    address =
      "#{address_1}<br/>#{address_2.present? ? "#{address_2}<br/>" : ''}" +
        "#{city}, #{state} #{formatted_postal_code} #{country_name}"


    address.html_safe
  end

  private

  # validations
  def validate_address_purpose
    return if %w[LOCATION MAILING].include?(address_purpose)

    errors.add(:base, 'Invalid Address Purpose')
  end
end
