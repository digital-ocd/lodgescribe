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

ActiveRecord::Schema.define(version: 20140305235445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "lodges", force: true do |t|
    t.integer  "subscription_id"
    t.string   "name"
    t.string   "sub_domain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "lodge_id"
    t.integer  "user_id"
    t.string   "role",       limit: 20, default: "member"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["lodge_id", "user_id"], name: "index_memberships_on_lodge_id_and_user_id", unique: true, using: :btree
  add_index "memberships", ["lodge_id"], name: "index_memberships_on_lodge_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.date     "initiated_at"
    t.date     "passed_at"
    t.date     "raised_at"
    t.date     "birth_date"
    t.string   "birth_city"
    t.string   "birth_state"
    t.string   "birth_country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["birth_date"], name: "index_profiles_on_birth_date", using: :btree
  add_index "profiles", ["initiated_at"], name: "index_profiles_on_initiated_at", using: :btree
  add_index "profiles", ["passed_at"], name: "index_profiles_on_passed_at", using: :btree
  add_index "profiles", ["raised_at"], name: "index_profiles_on_raised_at", using: :btree

  create_table "subscription_plans", force: true do |t|
    t.string   "name"
    t.string   "stripe_id"
    t.decimal  "amount",         precision: 10, scale: 2
    t.integer  "renewal_period",                          default: 1
    t.integer  "trial_period",                            default: 30
    t.text     "description"
    t.boolean  "is_featured",                             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscription_plans", ["name"], name: "index_subscription_plans_on_name", using: :btree
  add_index "subscription_plans", ["stripe_id"], name: "index_subscription_plans_on_stripe_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
