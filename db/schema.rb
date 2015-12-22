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

ActiveRecord::Schema.define(version: 20151222104540) do

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "workshop_id"
    t.integer  "duration"
    t.integer  "required_level"
    t.integer  "amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "products", ["workshop_id"], name: "index_products_on_workshop_id"

  create_table "receipts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "material_id", null: false
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "receipts", ["material_id"], name: "index_receipts_on_material_id"
  add_index "receipts", ["product_id"], name: "index_receipts_on_product_id"

  create_table "workshops", force: :cascade do |t|
    t.string   "name"
    t.integer  "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
