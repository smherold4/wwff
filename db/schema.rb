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

ActiveRecord::Schema.define(version: 20190218021034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "user_auth_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "encrypted_key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encrypted_key"], name: "index_user_auth_keys_on_encrypted_key", unique: true
    t.index ["user_id"], name: "index_user_auth_keys_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.string "gender"
    t.string "password_digest"
    t.string "password_reset_code"
    t.datetime "password_reset_code_sent_at"
    t.string "email"
    t.string "email_verification_code"
    t.datetime "email_verified_at"
    t.string "phone"
    t.string "phone_verification_code"
    t.datetime "phone_verified_at"
    t.datetime "last_login_at"
    t.text "signup_ref"
    t.text "signup_source"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

  add_foreign_key "user_auth_keys", "users"
end
