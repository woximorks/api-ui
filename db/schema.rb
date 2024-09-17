# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_11_204211) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associated_attrs", force: :cascade do |t|
    t.bigint "endpoint_id", null: false
    t.bigint "attr_id", null: false
    t.bigint "product_id", null: false
    t.jsonb "request_type", default: {}, null: false
    t.jsonb "ui_info", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attr_id"], name: "index_associated_attrs_on_attr_id"
    t.index ["endpoint_id"], name: "index_associated_attrs_on_endpoint_id"
    t.index ["product_id"], name: "index_associated_attrs_on_product_id"
  end

  create_table "attrs", force: :cascade do |t|
    t.string "attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "endpoints", force: :cascade do |t|
    t.string "endpoint_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "associated_attrs", "attrs"
  add_foreign_key "associated_attrs", "endpoints"
  add_foreign_key "associated_attrs", "products"
end
