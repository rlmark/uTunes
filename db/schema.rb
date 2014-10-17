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

ActiveRecord::Schema.define(version: 20141017033912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: true do |t|
    t.string   "status"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "name"
    t.integer  "credit_num"
    t.integer  "credit_cvv"
    t.string   "credit_exp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", force: true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "ordered_items", force: true do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
    t.string   "status"
  end

  create_table "products", force: true do |t|
    t.string   "album_name"
    t.text     "description"
    t.integer  "merchant_id"
    t.integer  "stock"
    t.integer  "price"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "artist"
  end

  create_table "ratings", force: true do |t|
    t.integer  "stars"
    t.text     "comments"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
