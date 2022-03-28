# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_26_171616) do
  create_table "addresses", force: :cascade do |t|
    t.string "address_purpose"
    t.string "address_type"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country_code"
    t.string "country_name"
    t.string "telephone_number"
    t.string "fax_number"
    t.integer "npi_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_addresses_on_npi_record_id"
  end

  create_table "basic_data", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "credential"
    t.string "sole_proprietor"
    t.string "gender"
    t.date "enumeration_date"
    t.date "last_updated"
    t.string "status"
    t.string "name"
    t.string "name_suffix"
    t.date "certification_date"
    t.integer "npi_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_basic_data_on_npi_record_id"
  end

  create_table "endpoints", force: :cascade do |t|
    t.string "endpointType"
    t.string "endpointTypeDescription"
    t.string "endpoint"
    t.string "endpointDescription"
    t.string "affiliation"
    t.string "affiliationName"
    t.string "use"
    t.string "useDescription"
    t.string "useOtherDescription"
    t.string "contentType"
    t.string "contentTypeDescription"
    t.string "contentOtherDescription"
    t.string "address_type"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "country_code"
    t.string "postal_code"
    t.string "country_name"
    t.integer "npi_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_endpoints_on_npi_record_id"
  end

  create_table "identifiers", force: :cascade do |t|
    t.string "identifier"
    t.string "code"
    t.string "desc"
    t.string "state"
    t.string "issuer"
    t.integer "npi_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_identifiers_on_npi_record_id"
  end

  create_table "npi_records", force: :cascade do |t|
    t.string "enumeration_type"
    t.integer "number"
    t.integer "last_updated_epoch"
    t.integer "created_epoch"
    t.integer "ordinal_position"
    t.text "other_names"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "code"
    t.string "desc"
    t.boolean "primary"
    t.string "state"
    t.string "license"
    t.integer "npi_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npi_record_id"], name: "index_taxonomies_on_npi_record_id"
  end

end
