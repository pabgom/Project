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

ActiveRecord::Schema.define(version: 20141216231220) do

  create_table "categories", force: true do |t|
    t.string   "Name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderitems", force: true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "total",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "orderitems", ["order_id"], name: "index_orderitems_on_order_id", using: :btree
  add_index "orderitems", ["product_id"], name: "index_orderitems_on_product_id_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.decimal  "total",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "Name"
    t.string   "Description"
    t.string   "Img_url"
    t.decimal  "Price",                precision: 10, scale: 0
    t.integer  "Category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Img_url_file_name"
    t.string   "Img_url_content_type"
    t.integer  "Img_url_file_size"
    t.datetime "Img_url_updated_at"
  end

  add_index "products", ["Category_id"], name: "index_products_on_Category_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
