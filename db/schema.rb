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

ActiveRecord::Schema.define(version: 2020_11_08_153547) do

  create_table "appointment_slots", force: :cascade do |t|
    t.integer "appointment_id", limit: 8, null: false
    t.integer "slot_id", limit: 8, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "appointment_slots_appointment_id_idx"
    t.index ["slot_id"], name: "appointment_slots_slot_id_idx"
  end

  create_table "appointments", force: :cascade do |t|
    t.date "date", null: false
    t.integer "user_id", limit: 8, null: false
    t.integer "doctor_id", limit: 8, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "users_doctor_id_idx"
    t.index ["user_id"], name: "users_user_id_idx"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "start_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "users_email_idx"
  end

end
