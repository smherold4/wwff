class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'
    create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.boolean "admin", null: false, default: false
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
      t.timestamps
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["phone"], name: "index_users_on_phone", unique: true
    end
  end
end
