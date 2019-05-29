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

ActiveRecord::Schema.define(version: 2019_05_29_113032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.datetime "date"
    t.integer "budget_cents", default: 0, null: false
    t.string "budget_currency", default: "GBP", null: false
    t.float "goal_progress"
    t.bigint "goal_id"
    t.bigint "wallet_id"
    t.string "show"
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_days_on_goal_id"
    t.index ["wallet_id"], name: "index_days_on_wallet_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "GBP", null: false
    t.integer "buffer_cents", default: 0, null: false
    t.string "buffer_currency", default: "GBP", null: false
    t.string "picture"
    t.string "link"
    t.date "completion_date"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "monthly_contribution_cents", default: 0, null: false
    t.index ["wallet_id"], name: "index_goals_on_wallet_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "GBP", null: false
    t.string "merchant"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "day_id"
    t.index ["day_id"], name: "index_transactions_on_day_id"
    t.index ["wallet_id"], name: "index_transactions_on_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "daily_income_cents", default: 0, null: false
    t.string "daily_income_currency", default: "GBP", null: false
    t.integer "savings_cents", default: 0, null: false
    t.string "savings_currency", default: "GBP", null: false
    t.integer "fixed_cost_cents", default: 0, null: false
    t.string "fixed_cost_currency", default: "GBP", null: false
    t.integer "current_balance_cents", default: 0, null: false
    t.string "current_balance_currency", default: "GBP", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "monthly_income_cents", default: 0, null: false
    t.integer "monthly_saving_cents", default: 0, null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "days", "goals"
  add_foreign_key "days", "wallets"
  add_foreign_key "goals", "wallets"
  add_foreign_key "transactions", "days"
  add_foreign_key "transactions", "wallets"
  add_foreign_key "wallets", "users"
end
