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

ActiveRecord::Schema.define(version: 2020_04_27_182829) do

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

  create_table "budgets", force: :cascade do |t|
    t.float "value"
    t.float "taxable_percentage"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "dollar_against_peso_value"
    t.integer "debt"
    t.datetime "start_date"
  end

  create_table "debts", force: :cascade do |t|
    t.text "description"
    t.integer "amount"
    t.integer "currency"
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_assets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
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
    t.index ["user_id"], name: "index_payments_on_user_id"
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
  end

  create_table "property_categories", force: :cascade do |t|
    t.string "name"
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "sent_newsletters", force: :cascade do |t|
    t.string "sent_newsletter_token"
    t.bigint "user_id"
    t.bigint "newsletter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "newsletter_variables", default: {}
    t.index ["newsletter_id"], name: "index_sent_newsletters_on_newsletter_id"
    t.index ["sent_newsletter_token"], name: "index_sent_newsletters_on_sent_newsletter_token"
    t.index ["user_id"], name: "index_sent_newsletters_on_user_id"
  end

  create_table "shortened_urls", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type", limit: 20
    t.text "url", null: false
    t.string "unique_key", limit: 10, null: false
    t.string "category"
    t.integer "use_count", default: 0, null: false
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category"], name: "index_shortened_urls_on_category"
    t.index ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type"
    t.index ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true
    t.index ["url"], name: "index_shortened_urls_on_url"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
