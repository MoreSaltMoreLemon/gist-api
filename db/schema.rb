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

ActiveRecord::Schema.define(version: 2019_04_26_202147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_yield_in_grams_by_units", force: :cascade do |t|
    t.integer "ingredient_id"
    t.decimal "yield_in_grams"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.decimal "scale_factor"
    t.decimal "yield_in_grams"
    t.decimal "yield"
    t.integer "yield_unit_id"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "step_ingredients", force: :cascade do |t|
    t.integer "step_id"
    t.integer "sequence_order"
    t.integer "ingredient_id"
    t.integer "recipe_id"
    t.decimal "quantity"
    t.integer "unit_id"
    t.boolean "fixed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "sequence_order"
    t.string "name"
    t.decimal "yield_in_grams"
    t.decimal "yield"
    t.integer "yield_unit_id"
    t.integer "prep_time_minutes"
    t.integer "post_prep_time_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.decimal "gram_conversion_factor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "bio"
    t.datetime "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
