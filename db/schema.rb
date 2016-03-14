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

ActiveRecord::Schema.define(version: 20160314075313) do

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

  create_table "address_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.string   "address_1",        null: false
    t.string   "address_2"
    t.integer  "province_id"
    t.string   "city",             null: false
    t.string   "postal_code"
    t.boolean  "current",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "address_type_id"
  end

  add_index "addresses", ["address_type_id"], name: "index_addresses_on_address_type_id", using: :btree
  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree
  add_index "addresses", ["province_id"], name: "index_addresses_on_province_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer  "province_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "company_services", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "service_id"
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "company_services", ["company_id"], name: "index_company_services_on_company_id", using: :btree
  add_index "company_services", ["service_id"], name: "index_company_services_on_service_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.string   "email"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "googleplus"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "contacts", ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer  "detailable_id"
    t.string   "detailable_type"
    t.string   "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "details", ["detailable_type", "detailable_id"], name: "index_details_on_detailable_type_and_detailable_id", using: :btree

  create_table "profile_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_types", ["name"], name: "index_profile_types_on_name", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "profile_type_id"
    t.integer  "profileable_id"
    t.string   "profileable_type"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "profiles", ["profile_type_id"], name: "index_profiles_on_profile_type_id", using: :btree
  add_index "profiles", ["profileable_type", "profileable_id"], name: "index_profiles_on_profileable_type_and_profileable_id", using: :btree

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
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "services", ["name"], name: "index_services_on_name", unique: true, using: :btree

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
  add_foreign_key "addresses", "address_types"
  add_foreign_key "addresses", "provinces"
  add_foreign_key "cities", "provinces"
  add_foreign_key "companies", "users"
  add_foreign_key "company_services", "companies"
  add_foreign_key "company_services", "services"
  add_foreign_key "profiles", "profile_types"
  add_foreign_key "properties", "companies"
  add_foreign_key "provinces", "countries"
end
