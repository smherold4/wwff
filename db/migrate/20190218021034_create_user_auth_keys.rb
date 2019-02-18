class CreateUserAuthKeys < ActiveRecord::Migration[5.1]
  def change
    create_table "user_auth_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.references :user, foreign_key: true, type: :uuid, null: false, on_delete: :cascade
      t.string "encrypted_key", null: false
      t.timestamps
      t.index ["encrypted_key"], name: "index_user_auth_keys_on_encrypted_key", unique: true
    end
  end
end
