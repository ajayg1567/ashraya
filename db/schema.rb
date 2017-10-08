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

ActiveRecord::Schema.define(version: 20170822212004) do

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.date     "booking_date",                                    null: false
    t.boolean  "breakfast",           limit: 1,   default: false
    t.boolean  "lunch",               limit: 1,   default: false
    t.boolean  "dinner",              limit: 1,   default: false
    t.string   "breakfast_user_name", limit: 255
    t.string   "breakfast_phone",     limit: 255
    t.string   "lunch_user_name",     limit: 255
    t.string   "lunch_phone",         limit: 255
    t.string   "dinner_user_name",    limit: 255
    t.string   "dinner_phone",        limit: 255
    t.boolean  "booked",              limit: 1,   default: false
  end

end
