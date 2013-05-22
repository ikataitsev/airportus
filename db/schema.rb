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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121221122732) do

  create_table "airports", :force => true do |t|
    t.integer  "external_id"
    t.string   "ident"
    t.string   "external_type"
    t.string   "name",              :limit => 1000
    t.decimal  "latitude_deg",                      :precision => 18, :scale => 15
    t.decimal  "longitude_deg",                     :precision => 18, :scale => 15
    t.integer  "elevation_ft"
    t.string   "continent"
    t.string   "iso_country"
    t.string   "iso_region"
    t.string   "municipality",      :limit => 1000
    t.string   "scheduled_service", :limit => 1000
    t.string   "gps_code"
    t.string   "iata_code"
    t.string   "local_code"
    t.string   "home_link",         :limit => 1000
    t.string   "wikipedia_link",    :limit => 1000
    t.text     "keywords"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  add_index "airports", ["external_id"], :name => "index_airports_on_external_id"
  add_index "airports", ["ident"], :name => "index_airports_on_ident"

end
