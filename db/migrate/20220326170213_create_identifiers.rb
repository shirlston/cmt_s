class CreateIdentifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :identifiers do |t|
      t.string :identifier
      t.string :code
      t.string :desc
      t.string :state
      t.string :issuer

      t.references :npi_record
      t.timestamps
    end
  end
end
