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

ActiveRecord::Schema.define(version: 20160201161904) do

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "seats"
    t.integer  "flight_id"
    t.string   "user_id"
    t.decimal  "cost",           precision: 8, scale: 2
    t.boolean  "payment_status"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "ref"
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "departure_id"
    t.integer  "arrival_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.date     "departure_date"
    t.string   "departure_time"
    t.string   "flight_number"
    t.string   "duration"
    t.string   "airline"
    t.decimal  "economy",        precision: 8, scale: 2
    t.decimal  "business",       precision: 8, scale: 2
    t.decimal  "first",          precision: 8, scale: 2
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "booking_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "cabin"
    t.decimal  "cost",       precision: 8, scale: 2
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
