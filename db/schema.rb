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

ActiveRecord::Schema.define(version: 20160411040149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                   default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "username",               limit: 24,              null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "carrier_categories", force: :cascade do |t|
    t.string "name", default: "", null: false
  end

  create_table "license_categories", force: :cascade do |t|
    t.string "name", default: "", null: false
  end

  create_table "news_categories", force: :cascade do |t|
    t.string "name", default: "", null: false
  end

  create_table "other_categories", force: :cascade do |t|
    t.string   "category_type"
    t.string   "category_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "carrier_category_id"
    t.integer  "license_category_id"
    t.integer  "product_category_id"
    t.integer  "news_category_id"
    t.integer  "admin_id"
    t.boolean  "facebook",            default: false
    t.boolean  "twitter",             default: false
    t.boolean  "linkedin",            default: false
    t.datetime "schedule_at"
  end

  add_index "posts", ["admin_id"], name: "index_posts_on_admin_id", using: :btree
  add_index "posts", ["carrier_category_id"], name: "index_posts_on_carrier_category_id", using: :btree
  add_index "posts", ["license_category_id"], name: "index_posts_on_license_category_id", using: :btree
  add_index "posts", ["news_category_id"], name: "index_posts_on_news_category_id", using: :btree
  add_index "posts", ["product_category_id"], name: "index_posts_on_product_category_id", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.string "name", default: "", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "user_carrier_categories", force: :cascade do |t|
    t.integer "user_id",             default: 0, null: false
    t.integer "carrier_category_id",             null: false
  end

  add_index "user_carrier_categories", ["user_id", "carrier_category_id"], name: "my_index", using: :btree

  create_table "user_facebook_profiles", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password"
    t.string   "token"
  end

  create_table "user_license_categories", force: :cascade do |t|
    t.integer "user_id",             default: 0, null: false
    t.integer "license_category_id", default: 0, null: false
  end

  create_table "user_linkedin_profiles", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "password"
    t.string   "token"
    t.string   "secret"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "user_linkedin_profiles", ["user_id"], name: "index_user_linkedin_profiles_on_user_id", using: :btree

  create_table "user_news_categories", force: :cascade do |t|
    t.integer "user_id",          default: 0, null: false
    t.integer "news_category_id", default: 0, null: false
  end

  create_table "user_product_categories", force: :cascade do |t|
    t.integer "user_id",             default: 0, null: false
    t.integer "product_category_id", default: 0, null: false
  end

  create_table "user_twitter_profiles", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "password"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret"
    t.string   "token"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                   default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name",             limit: 24
    t.string   "last_name",              limit: 24
    t.string   "username",               limit: 24,              null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "default_avatar"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
