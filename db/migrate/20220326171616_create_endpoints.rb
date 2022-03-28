class CreateEndpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :endpoints do |t|
      t.string :endpointType
      t.string :endpointTypeDescription
      t.string :endpoint
      t.string :endpointDescription
      t.string :affiliation
      t.string :affiliationName
      t.string :use
      t.string :useDescription
      t.string :useOtherDescription
      t.string :contentType
      t.string :contentTypeDescription
      t.string :contentOtherDescription
      t.string :address_type
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country_code
      t.string :postal_code
      t.string :country_name

      t.references :npi_record
      t.timestamps
    end
  end
end
