class CreateBasicData < ActiveRecord::Migration[7.0]
  def change
    create_table :basic_data do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :credential
      t.string :sole_proprietor
      t.string :gender
      t.date :enumeration_date
      t.date :last_updated
      t.string :status
      t.string :name
      t.string :name_suffix
      t.date :certification_date

      t.references :npi_record
      t.timestamps
    end
  end
end
