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

ActiveRecord::Schema.define(version: 20150925160956) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "currency_unit"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "max_price_per_month"
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "email"
    t.boolean  "stay_anonymous",   default: false
    t.string   "where"
    t.integer  "how_many"
    t.boolean  "is_private",       default: false
    t.boolean  "is_open_office",   default: false
    t.boolean  "is_co_working",    default: false
    t.boolean  "is_shared_office", default: false
    t.integer  "how_much"
    t.string   "how_long"
    t.string   "when"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "is_verified",      default: false
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "space_id"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rank"
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "fixed_desk_price_in_base"
    t.string   "phone_number"
    t.string   "email"
    t.boolean  "is_verified",              default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "desk_type"
    t.boolean  "meeting_room"
    t.string   "twitter"
    t.boolean  "has_full_access",          default: false
    t.text     "description"
    t.string   "postcode"
    t.integer  "city_id"
    t.integer  "hot_desk_price_in_base"
  end

end
