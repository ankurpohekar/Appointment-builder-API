class Init < ActiveRecord::Migration[5.2]
  def change
  	create_table "users" do |t|
  		t.string   "name",     limit: 255, null: false
      t.string   "email",    limit: 255, null: false
      t.string   "password_digest", null: false
      t.datetime "created_at",           null: false
      t.datetime "updated_at",           null: false
  	end
  	add_index "users", "email", name: "users_email_idx", using: :btree

  	create_table "doctors" do |t|
      t.string   "name",       limit: 255, null: false
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
  	end
    
    create_table "appointments" do |t|
      t.date "date", null: false
      t.integer "user_id", limit: 8, null: false
      t.integer "doctor_id", limit: 8, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    

    create_table "slots" do |t|
      t.string   "name",           limit: 255, null: false
      t.string   "start_time",                 null: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
    end
    
    create_table "appointment_slots" do |t|
      t.integer "appointment_id", limit: 8,    null: false
      t.integer "slot_id",        limit: 8,    null: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
    end

    add_index "appointments", "user_id", name: "users_user_id_idx", using: :btree
    add_index "appointments", "doctor_id", name: "users_doctor_id_idx", using: :btree
    add_index "appointment_slots", "appointment_id", name: "appointment_slots_appointment_id_idx", using: :btree
    add_index "appointment_slots", "slot_id", name: "appointment_slots_slot_id_idx", using: :btree

    add_foreign_key "appointments", "users", name: "appointments_user_id_FK", on_update: :cascade, on_delete: :cascade
    add_foreign_key "appointments", "doctors", name: "appointments_doctor_id_FK", on_update: :cascade, on_delete: :cascade
    add_foreign_key "slots", "appointments", name: "appointments_appointment_id_FK", on_update: :cascade, on_delete: :cascade
    add_foreign_key "appointment_slots", "appointments", name: "appointment_slots_appointment_id_FK", on_update: :cascade, on_delete: :cascade
    add_foreign_key "appointment_slots", "doctors", name: "appointment_slots_slot_id_FK", on_update: :cascade, on_delete: :cascade

  end
end
