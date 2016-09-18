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

ActiveRecord::Schema.define(version: 20160918024518) do

  create_table "bookings", force: :cascade do |t|
    t.date     "date"
    t.time     "timefrom"
    t.time     "timeto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "users_id"
    t.integer  "rooms_id"
    t.index ["rooms_id"], name: "index_bookings_on_rooms_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "bname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "rnumber"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "size"
    t.string   "status"
    t.integer  "buildings_id"
    t.index ["buildings_id"], name: "index_rooms_on_buildings_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "uname"
    t.string   "uemail"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "utype"
  end

end
