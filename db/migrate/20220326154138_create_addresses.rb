class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_purpose
      t.string :address_type
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country_code
      t.string :country_name
      t.string :telephone_number
      t.string :fax_number

      t.references :npi_record
      t.timestamps
    end
  end
end
