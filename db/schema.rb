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

ActiveRecord::Schema.define(version: 2019_02_28_053812) do

  create_table "channel_rates", force: :cascade do |t|
    t.string "guid"
    t.string "base_rate_type"
    t.string "modifier_type"
    t.boolean "turned_on"
    t.boolean "turned_off_on"
    t.float "rate"
    t.float "amount"
    t.string "channel_name"
    t.string "channel_guid"
    t.string "facility_guid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_applications", force: :cascade do |t|
    t.string "guid"
    t.string "name"
    t.boolean "channel_rates_on"
    t.boolean "internal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_applications_discount_plans", id: false, force: :cascade do |t|
    t.integer "discount_plan_id", null: false
    t.integer "client_application_id", null: false
    t.index ["client_application_id", "discount_plan_id"], name: "idx_discount_plans_client_applications_2"
    t.index ["discount_plan_id", "client_application_id"], name: "idx_discount_plans_client_applications_1"
  end

  create_table "controls", force: :cascade do |t|
    t.string "guid"
    t.string "kind"
    t.integer "min_value"
    t.integer "max_value"
    t.boolean "deleted"
    t.date "deleted_on"
    t.string "requirements_text"
    t.integer "applicable_discount_plans_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "controls_discount_plans", id: false, force: :cascade do |t|
    t.integer "discount_plan_id", null: false
    t.integer "control_id", null: false
    t.index ["control_id", "discount_plan_id"], name: "idx_discount_plans_controls_2"
    t.index ["discount_plan_id", "control_id"], name: "idx_discount_plans_controls_1"
  end

  create_table "controls_unit_amenities", id: false, force: :cascade do |t|
    t.integer "control_id", null: false
    t.integer "unit_amenity_id", null: false
    t.index ["control_id", "unit_amenity_id"], name: "idx_controls_unit_amenities_1"
    t.index ["unit_amenity_id", "control_id"], name: "idx_controls_unit_amenities_2"
  end

  create_table "discount_plans", force: :cascade do |t|
    t.string "guid"
    t.string "name"
    t.string "description"
    t.string "public_description"
    t.string "availability_text"
    t.string "requirements_text"
    t.string "kind"
    t.boolean "min_occupancy_required"
    t.integer "min_occupancy_months"
    t.boolean "prepay_required"
    t.integer "prepay_months"
    t.date "start_date"
    t.date "end_date"
    t.boolean "auto_apply"
    t.string "promotion_type"
    t.boolean "deleted"
    t.boolean "turned_on"
    t.boolean "available_for_all_facilities"
    t.boolean "round_to_nearest"
    t.boolean "hide_from_website"
    t.boolean "move_in_only"
    t.string "tenant_account_kind_guid"
    t.boolean "existing_tenant_only"
    t.integer "priority"
    t.string "role_permission"
    t.string "always_discount_plan_discount_guid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "facility_guids", default: "--- []\n"
    t.text "api_association_guids", default: "--- []\n"
  end

  create_table "discount_plans_discounts", id: false, force: :cascade do |t|
    t.integer "discount_plan_id", null: false
    t.integer "discount_id", null: false
    t.index ["discount_id", "discount_plan_id"], name: "idx_discount_plans_discounts_2"
    t.index ["discount_plan_id", "discount_id"], name: "idx_discount_plans_discounts_1"
  end

  create_table "discount_plans_unit_groups", id: false, force: :cascade do |t|
    t.integer "unit_group_id", null: false
    t.integer "discount_plan_id", null: false
    t.index ["discount_plan_id", "unit_group_id"], name: "idx_unit_groups_discount_plans_2"
    t.index ["unit_group_id", "discount_plan_id"], name: "idx_unit_groups_discount_plans_1"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "guid"
    t.string "discount_type"
    t.integer "month_number"
    t.float "amount"
    t.float "minimum_amount"
    t.float "maximum_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoiceable_fees", force: :cascade do |t|
    t.string "guid"
    t.string "product_code"
    t.string "kind"
    t.string "description"
    t.boolean "required_at_move_in"
    t.boolean "required_at_transfer"
    t.integer "amount"
    t.string "short_description"
    t.boolean "show_in_sales_center"
    t.integer "tax_total"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoiceable_fees_unit_groups", id: false, force: :cascade do |t|
    t.integer "unit_group_id", null: false
    t.integer "invoiceable_fee_id", null: false
    t.index ["invoiceable_fee_id", "unit_group_id"], name: "idx_unit_groups_invoiceable_fees_2"
    t.index ["unit_group_id", "invoiceable_fee_id"], name: "idx_unit_groups_invoiceable_fees_1"
  end

  create_table "unit_amenities", force: :cascade do |t|
    t.string "guid"
    t.string "name"
    t.string "short_code"
    t.boolean "show_in_sales_center_filter_dropdown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_amenities_units", id: false, force: :cascade do |t|
    t.integer "unit_amenity_id", null: false
    t.integer "unit_id", null: false
    t.index ["unit_amenity_id", "unit_id"], name: "idx_unit_amenities_units_1"
    t.index ["unit_id", "unit_amenity_id"], name: "idx_unit_amenities_units_2"
  end

  create_table "unit_groups", force: :cascade do |t|
    t.string "guid"
    t.float "price"
    t.string "group_key"
    t.string "name"
    t.integer "available_units_count"
    t.integer "total_units_count"
    t.integer "total_non_excluded_units_count"
    t.string "size"
    t.integer "standard_rate"
    t.integer "floor"
    t.float "reduced_price"
    t.integer "occupancy_percent"
    t.integer "area"
    t.integer "length"
    t.integer "width"
    t.integer "height"
    t.float "due_at_move_in"
    t.float "due_at_move_in_without_fees"
    t.integer "due_monthly"
    t.string "attribute_description"
    t.string "description"
    t.float "average_rent"
    t.string "active_rate_type"
    t.integer "channel_rate_id"
    t.integer "unit_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "scheduled_move_out_guids", default: "--- []\n"
    t.text "channel_rate_guids", default: "--- []\n"
    t.index ["channel_rate_id"], name: "index_unit_groups_on_channel_rate_id"
    t.index ["unit_type_id"], name: "index_unit_groups_on_unit_type_id"
  end

  create_table "unit_types", force: :cascade do |t|
    t.string "guid"
    t.string "name"
    t.boolean "deleted"
    t.string "internal_account_code"
    t.string "code_and_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "units" because of following StandardError
#   Unknown type 'strin' for column 'access_type'

end
