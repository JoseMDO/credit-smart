# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_23_154736) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "name"
    t.integer "annual_fee"
    t.string "issuer"
    t.string "url"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "credit_card_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credit_card_id"], name: "index_favorites_on_credit_card_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "credit_card_id", null: false
    t.decimal "percentage_back"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_rewards_on_category_id"
    t.index ["credit_card_id"], name: "index_rewards_on_credit_card_id"
  end

  create_table "user_transactions", force: :cascade do |t|
    t.integer "owner_id", null: false
    t.integer "category_id", null: false
    t.decimal "amount"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_transactions_on_category_id"
    t.index ["owner_id"], name: "index_user_transactions_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "favorites", "credit_cards"
  add_foreign_key "favorites", "users"
  add_foreign_key "rewards", "categories"
  add_foreign_key "rewards", "credit_cards"
  add_foreign_key "user_transactions", "categories"
  add_foreign_key "user_transactions", "users", column: "owner_id"
end
