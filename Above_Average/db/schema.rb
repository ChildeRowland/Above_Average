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

ActiveRecord::Schema.define(version: 20140826212312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: true do |t|
    t.integer  "age"
    t.integer  "zip"
    t.integer  "total_household_members"
    t.string   "fname"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recyclings", force: true do |t|
    t.integer  "local"
    t.integer  "compost"
    t.integer  "fabric"
    t.integer  "ewaste"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total"
  end

  create_table "travels", force: true do |t|
    t.float    "walk"
    t.float    "train"
    t.float    "bus"
    t.float    "car"
    t.float    "plane"
    t.float    "normalized_walk"
    t.float    "normalized_train"
    t.float    "normalized_bus"
    t.float    "normalized_car"
    t.float    "normalized_plane"
    t.float    "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "bicycle"
    t.float    "normalized_bicycle"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "utilities", force: true do |t|
    t.integer  "kwh"
    t.integer  "therms"
    t.integer  "gallons"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "normalized_kwh"
    t.float    "normalized_therms"
    t.float    "normalized_gallons"
    t.float    "total"
  end

end
