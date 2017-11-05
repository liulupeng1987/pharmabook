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

ActiveRecord::Schema.define(version: 20171105004108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "andas", force: :cascade do |t|
    t.string   "product"
    t.integer  "medicine_manufacturer_id"
    t.string   "strength"
    t.string   "number"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "manufacturer"
    t.string   "submission_status"
    t.date     "approval_date"
  end

  create_table "andasearches", force: :cascade do |t|
    t.string   "query"
    t.string   "user_email"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apis", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "manufacturer"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "medicine_manufacturer_id"
    t.index ["manufacturer"], name: "index_apis_on_manufacturer", using: :btree
    t.index ["name"], name: "index_apis_on_name", using: :btree
  end

  create_table "apisearches", force: :cascade do |t|
    t.string   "query"
    t.string   "user_email"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "author"
    t.boolean  "is_hidden"
    t.text     "summary"
    t.integer  "row_order"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image_id"
    t.string   "image_filename"
    t.integer  "image_size"
    t.string   "image_content_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "medicine_manufacturers", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.text     "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email"
    t.string   "chinesename"
  end

  create_table "medicines", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "strength"
    t.string   "manufacturer_name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "medicine_manufacturer_id"
    t.index ["manufacturer_name"], name: "index_medicines_on_manufacturer_name", using: :btree
    t.index ["name"], name: "index_medicines_on_name", using: :btree
    t.index ["number"], name: "index_medicines_on_number", using: :btree
  end

  create_table "medsearches", force: :cascade do |t|
    t.string   "query"
    t.string   "user_email"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total",            default: 0
    t.integer  "user_id"
    t.string   "billing_name"
    t.string   "billing_address"
    t.string   "shipping_name"
    t.string   "shipping_address"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "token"
    t.boolean  "is_paid",          default: false
    t.string   "payment_method"
    t.string   "aasm_state",       default: "order_placed"
    t.index ["aasm_state"], name: "index_orders_on_aasm_state", using: :btree
  end

  create_table "product_lists", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "product_name"
    t.integer  "product_price"
    t.integer  "product_quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_admin",               default: false
    t.boolean  "is_inspector",           default: false
    t.string   "country"
    t.string   "company"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
