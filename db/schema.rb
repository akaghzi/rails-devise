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

ActiveRecord::Schema.define(version: 20160312102857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "property_id"
    t.integer  "role_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "access_lists", ["company_id"], name: "index_access_lists_on_company_id", using: :btree
  add_index "access_lists", ["property_id"], name: "index_access_lists_on_property_id", using: :btree
  add_index "access_lists", ["role_id"], name: "index_access_lists_on_role_id", using: :btree
  add_index "access_lists", ["user_id"], name: "index_access_lists_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "province_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree
  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "properties", ["company_id"], name: "index_properties_on_company_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "role_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "services", ["company_id"], name: "index_services_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                null: false
    t.string   "encrypted_password",     default: "",                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                 null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,                                 null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "firstname",                                                          null: false
    t.string   "middlename"
    t.string   "lastname",                                                           null: false
    t.string   "phone",                                                              null: false
    t.boolean  "ismember",               default: false,                             null: false
    t.boolean  "issecured",              default: false,                             null: false
    t.boolean  "termsaccepted",          default: false,                             null: false
    t.string   "timezone",               default: "Eastern Timezone(US and Canada)", null: false
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "access_lists", "companies"
  add_foreign_key "access_lists", "properties"
  add_foreign_key "access_lists", "roles"
  add_foreign_key "access_lists", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "provinces"
  add_foreign_key "companies", "users"
  add_foreign_key "properties", "companies"
  add_foreign_key "provinces", "countries"
  add_foreign_key "services", "companies"
end
