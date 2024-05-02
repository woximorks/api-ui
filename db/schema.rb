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

ActiveRecord::Schema[7.1].define(version: 2024_04_29_214644) do
  create_table "attrs", force: :cascade do |t|
    t.string "attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "endpoint_associated_attrs", force: :cascade do |t|
    t.integer "endpoint_id", null: false
    t.integer "attr_id", null: false
    t.boolean "endpoint_create"
    t.boolean "endpoint_update"
    t.boolean "endpoint_show"
    t.boolean "endpoint_index"
    t.boolean "endpoint_delete"
    t.boolean "attr_create_request"
    t.boolean "attr_create_response"
    t.boolean "attr_delete_request"
    t.boolean "attr_delete_response"
    t.boolean "attr_index_request"
    t.boolean "attr_index_response"
    t.boolean "attr_show_request"
    t.boolean "attr_show_response"
    t.boolean "attr_update_request"
    t.boolean "attr_update_response"
    t.string "attr_type"
    t.string "associated_ui_info"
    t.string "associated_product_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attr_id"], name: "index_endpoint_associated_attrs_on_attr_id"
    t.index ["endpoint_id"], name: "index_endpoint_associated_attrs_on_endpoint_id"
  end

  create_table "endpoints", force: :cascade do |t|
    t.string "endpoint_title"
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

  add_foreign_key "endpoint_associated_attrs", "attrs"
  add_foreign_key "endpoint_associated_attrs", "endpoints"
end
