class CreateTaxonomies < ActiveRecord::Migration[7.0]
  def change
    create_table :taxonomies do |t|

      t.string :code
      t.string :desc
      t.boolean :primary
      t.string :state
      t.string :license

      t.references :npi_record
      t.timestamps
    end
  end
end
