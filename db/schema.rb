# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to

ActiveRecord::Schema.define(version: 20160203165415) do

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
    t.integer  "cost"
    t.boolean  "payment_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "ref"
    t.string   "anon_email"
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "departure_id"
    t.integer  "arrival_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "departure_date"
    t.string   "departure_time"
    t.string   "flight_number"
    t.string   "duration"
    t.string   "airline"
    t.integer  "economy"
    t.integer  "business"
    t.integer  "first"
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cabin"
    t.integer  "cost"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
