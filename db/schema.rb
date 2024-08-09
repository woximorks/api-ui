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

ActiveRecord::Schema[7.1].define(version: 2024_08_09_173354) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_log_attrs", force: :cascade do |t|
    t.string "action_log_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agent_attrs", force: :cascade do |t|
    t.string "agent_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attrs", force: :cascade do |t|
    t.string "attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brand_attrs", force: :cascade do |t|
    t.string "brand_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyer_transaction_attrs", force: :cascade do |t|
    t.string "buyer_transaction_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_attrs", force: :cascade do |t|
    t.string "company_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_transaction_attrs", force: :cascade do |t|
    t.string "company_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_attrs", force: :cascade do |t|
    t.string "contact_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_campaign_attrs", force: :cascade do |t|
    t.string "email_campaign_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "endpoint_associated_attrs", force: :cascade do |t|
    t.bigint "endpoint_id", null: false
    t.boolean "endpoint_create"
    t.boolean "endpoint_update"
    t.boolean "endpoint_show"
    t.boolean "endpoint_index"
    t.boolean "endpoint_delete"
    t.bigint "attr_id", null: false
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

  create_table "event_attrs", force: :cascade do |t|
    t.string "event_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gallery_attrs", force: :cascade do |t|
    t.string "gallery_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_attrs", force: :cascade do |t|
    t.string "group_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lead_source_attrs", force: :cascade do |t|
    t.string "lead_source_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_attrs", force: :cascade do |t|
    t.string "listing_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_attrs", force: :cascade do |t|
    t.string "office_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "presentation_log_attrs", force: :cascade do |t|
    t.string "presentation_log_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sold_listings_attrs", force: :cascade do |t|
    t.string "sold_listings_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_attrs", force: :cascade do |t|
    t.string "task_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_attrs", force: :cascade do |t|
    t.string "team_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "web_user_attrs", force: :cascade do |t|
    t.string "web_user_attr_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "endpoint_associated_attrs", "attrs"
  add_foreign_key "endpoint_associated_attrs", "endpoints"
end
