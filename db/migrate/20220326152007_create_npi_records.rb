class CreateNpiRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :npi_records do |t|
      t.string :enumeration_type, nil: false
      t.integer :number, nil: false
      t.integer :last_updated_epoch
      t.integer :created_epoch
      t.integer :ordinal_position

      # other_names is a serialized array
      t.text :other_names
      t.timestamps
    end
  end
end
