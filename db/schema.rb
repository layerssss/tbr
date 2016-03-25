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

ActiveRecord::Schema.define(version: 20160326070957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "continents", force: :cascade do |t|
    t.string   "name"
    t.text     "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "continent_id"
    t.text     "flag"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "from"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "thumbnail"
    t.string   "url"
    t.datetime "time"
    t.string   "f_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "link"
  end

  create_table "stays", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.date     "arrival"
    t.integer  "days",       default: 1
    t.integer  "amount",     default: 20
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "stays", ["country_id"], name: "index_stays_on_country_id", using: :btree

end
