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

ActiveRecord::Schema.define(version: 20160605151057) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "quantity",   limit: 4, default: 1
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "url",         limit: 255
    t.text     "description", limit: 65535
  end

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",     limit: 4
    t.integer  "posts_count", limit: 4,     default: 0
  end

  create_table "order_infos", force: :cascade do |t|
    t.integer  "order_id",         limit: 4
    t.string   "billing_name",     limit: 255
    t.string   "billing_address",  limit: 255
    t.string   "shipping_name",    limit: 255
    t.string   "shipping_address", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",     limit: 4
    t.string   "product_name", limit: 255
    t.integer  "price",        limit: 4
    t.integer  "quantity",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "total",          limit: 4,   default: 0
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "token",          limit: 255
    t.boolean  "is_paid",                    default: false
    t.string   "payment_method", limit: 255
    t.string   "aasm_state",     limit: 255, default: "order_placed"
  end

  add_index "orders", ["aasm_state"], name: "index_orders_on_aasm_state", using: :btree
  add_index "orders", ["token"], name: "index_orders_on_token", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "group_id",   limit: 255
    t.string   "type_id",    limit: 255
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "quantity",    limit: 4
    t.integer  "price",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "type_id",     limit: 255
  end

  create_table "types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "order",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "is_admin",                           default: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
