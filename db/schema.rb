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

ActiveRecord::Schema.define(version: 20180309150438) do

  create_table "bags", force: :cascade do |t|
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "territory_id"
  end

  create_table "congregations", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "address"
    t.string "street"
    t.datetime "meeting_times"
    t.datetime "saturday_field_service_start_time"
    t.boolean "saturday_meet_at_the_hall?"
    t.boolean "wednesday_evening_service_meeting?"
    t.datetime "wednesday_evening_service_meeting_date_time"
    t.string "scheduled_public_talk_title"
    t.datetime "special_talk_date_time"
    t.string "special_talk_title"
    t.datetime "memorial_date_time"
    t.datetime "regional_convention_date_time"
    t.string "regional_convention_theme"
    t.datetime "co_visit_start_date"
    t.datetime "co_visit_end_date"
    t.string "thirty_hour_aux_months"
    t.integer "publisher_id"
    t.integer "territory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "do_not_calls", force: :cascade do |t|
    t.integer "territory_id"
    t.integer "address"
    t.string "street"
    t.date "date"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_to_house_records", force: :cascade do |t|
    t.integer "territory_id"
    t.integer "publisher_id"
    t.integer "address"
    t.string "street"
    t.string "note_symbol"
    t.boolean "do_not_call?", default: false
    t.text "notes"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publisher_territories", force: :cascade do |t|
    t.integer "territory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bag_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "username"
    t.integer "congregation_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "service_group"
    t.datetime "your_saturday_field_service_group_start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "bag_id"
    t.string "email"
  end

  create_table "territories", force: :cascade do |t|
    t.integer "number"
    t.string "designation"
    t.string "street_names"
    t.date "sign_out_date"
    t.date "completed_date"
    t.boolean "card_lost?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "congregation_id"
    t.string "signed_out"
    t.integer "bag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.integer "publisher_id"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
