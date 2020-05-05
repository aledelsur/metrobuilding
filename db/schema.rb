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

ActiveRecord::Schema.define(version: 2020_05_04_203852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_readonly", default: false
    t.bigint "project_id"
    t.bigint "company_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "budgets", force: :cascade do |t|
    t.float "value"
    t.float "taxable_percentage"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "dollar_against_peso_value"
    t.integer "debt"
    t.datetime "start_date"
    t.float "rate_1", default: 1.0
    t.float "rate_2", default: 1.0
    t.bigint "project_id"
    t.bigint "company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_features", force: :cascade do |t|
    t.bigint "company_id"
    t.boolean "boolean_value", default: true
    t.integer "integer_value"
    t.datetime "datetime_value"
    t.string "string_value"
    t.integer "feature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_features_on_company_id"
  end

  create_table "debts", force: :cascade do |t|
    t.text "description"
    t.integer "amount"
    t.integer "currency"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "company_id"
  end

  create_table "media_assets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.bigint "project_id"
    t.bigint "company_id"
  end

  create_table "media_assets_newsletter_sections", force: :cascade do |t|
    t.bigint "media_asset_id"
    t.bigint "newsletter_section_id"
    t.index ["media_asset_id"], name: "index_media_assets_newsletter_sections_on_media_asset_id"
    t.index ["newsletter_section_id"], name: "index_media_assets_newsletter_sections_on_newsletter_section_id"
  end

  create_table "newsletter_sections", force: :cascade do |t|
    t.integer "newsletter_id"
    t.string "title"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.datetime "sent_at"
    t.text "email_content"
    t.bigint "project_id"
    t.bigint "company_id"
  end

  create_table "payment_properties", force: :cascade do |t|
    t.integer "payment_id"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_payment_properties_on_payment_id"
    t.index ["property_id"], name: "index_payment_properties_on_property_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float "value"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "dollar_against_peso_value"
    t.float "dollar_value"
    t.integer "payment_type"
    t.string "check_number"
    t.bigint "project_id"
    t.bigint "company_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_projects_on_company_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "property_category_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section"
    t.string "apartment"
    t.string "floor"
    t.string "rooms"
    t.string "garage"
    t.bigint "project_id"
    t.bigint "company_id"
  end

  create_table "property_categories", force: :cascade do |t|
    t.string "name"
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "company_id"
  end

  create_table "property_debts", force: :cascade do |t|
    t.integer "property_id"
    t.integer "debt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debt_id"], name: "index_property_debts_on_debt_id"
    t.index ["property_id"], name: "index_property_debts_on_property_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "value"
    t.string "month"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.string "name"
    t.string "concept"
    t.bigint "project_id"
    t.bigint "company_id"
  end

  create_table "sent_newsletters", force: :cascade do |t|
    t.string "sent_newsletter_token"
    t.bigint "user_id"
    t.bigint "newsletter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "newsletter_variables", default: {}
    t.bigint "project_id"
    t.bigint "company_id"
    t.index ["newsletter_id"], name: "index_sent_newsletters_on_newsletter_id"
    t.index ["sent_newsletter_token"], name: "index_sent_newsletters_on_sent_newsletter_token"
    t.index ["user_id"], name: "index_sent_newsletters_on_user_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_projects_on_company_id"
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "dni"
    t.string "email"
    t.string "cuit"
    t.string "phone_number"
    t.string "mobile_number"
    t.string "address_1"
    t.string "address_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "current_debt"
    t.text "notes"
    t.bigint "company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
