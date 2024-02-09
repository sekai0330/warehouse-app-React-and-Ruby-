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

ActiveRecord::Schema[7.1].define(version: 2024_02_09_083317) do
  create_table "authority_client_pages", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "user_authority_id"
    t.integer "client_page_id"
    t.boolean "is_edit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_pages", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "code_name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processing_data", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.integer "processing_classification", default: 0, null: false, comment: "0->入庫, 1->出庫"
    t.datetime "processing_date", default: "2024-02-09 12:08:44", null: false, comment: "入出庫日"
    t.bigint "warehouse_id", null: false
    t.bigint "shipper_id", null: false
    t.integer "processing_no", null: false
    t.integer "lot_num", null: false
    t.decimal "weight", precision: 6, scale: 2, default: "0.0", null: false
    t.string "processing_num", default: "", null: false
    t.decimal "unit_price", precision: 6, scale: 2, default: "0.0", null: false
    t.bigint "reg_user_id", null: false
    t.bigint "update_user_id"
    t.integer "is_canceled", default: 0, null: false, comment: "1->キャンセル"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reg_user_id"], name: "index_processing_data_on_reg_user_id"
    t.index ["shipper_id"], name: "index_processing_data_on_shipper_id"
    t.index ["update_user_id"], name: "index_processing_data_on_update_user_id"
    t.index ["warehouse_id"], name: "index_processing_data_on_warehouse_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "packing"
    t.string "unit_price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shippers", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "post_code"
    t.string "address1"
    t.string "address2"
    t.string "telephone_number"
    t.string "closing_date"
    t.string "calc_category"
    t.float "used_tsubo_price"
    t.float "discount_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
  end

  create_table "unit_prices", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "packing"
    t.float "handling_fee_unit"
    t.float "storage_fee_unit"
    t.string "billing_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_authorities", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.integer "auth_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_logs", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "login_id"
    t.string "login_ip"
    t.string "user_agent"
    t.string "login_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.string "login_id", default: "", null: false, comment: "ログインID"
    t.integer "authority", default: 1, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "processing_data", "shippers"
  add_foreign_key "processing_data", "users", column: "reg_user_id"
  add_foreign_key "processing_data", "users", column: "update_user_id"
  add_foreign_key "processing_data", "warehouses"
end
