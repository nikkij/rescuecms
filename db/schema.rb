# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140724065907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.text     "street"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "zip_code"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animal_breeds", force: true do |t|
    t.string   "name"
    t.integer  "animal_species_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animal_coat_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animal_colors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animal_sexes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animal_sizes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animal_species", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animal_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "animals", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "short_code"
    t.string   "litter"
    t.integer  "animal_sex_id"
    t.integer  "animal_type_id"
    t.integer  "animal_color_id"
    t.integer  "animal_coat_type_id"
    t.integer  "animal_size_id"
    t.integer  "animal_species_id"
    t.integer  "animal_breed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.integer  "location_id"
  end

  create_table "locations", force: true do |t|
    t.integer "as_location_id"
    t.string  "as_location_type"
  end

  add_index "locations", ["as_location_id", "as_location_type"], name: "locations_as_location_index", using: :btree

  create_table "on_premises_locations", force: true do |t|
    t.string "area"
    t.string "unit"
  end

  create_table "organizational_locations", force: true do |t|
  end

  create_table "residence_locations", force: true do |t|
  end

  create_table "states", force: true do |t|
    t.string "name"
    t.string "abbreviation"
  end

end
