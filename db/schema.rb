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

ActiveRecord::Schema.define(version: 2019_04_29_204432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.string "uuid", default: ""
    t.string "hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "uuid", default: ""
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_steps", force: :cascade do |t|
    t.string "uuid", default: ""
    t.integer "recipe_id"
    t.decimal "yield", default: "0.0"
    t.decimal "yield_in_grams", default: "0.0"
    t.integer "yield_unit_id", default: 1
    t.integer "sequence_order", default: 0
    t.string "color", default: "#a6cee3"
    t.string "name", default: ""
    t.string "instruction", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "uuid", default: ""
    t.string "name", default: ""
    t.string "description", default: ""
    t.integer "user_id"
    t.decimal "scale_factor", default: "0.0"
    t.decimal "yield_in_grams", default: "0.0"
    t.decimal "yield", default: "0.0"
    t.integer "yield_unit_id", default: 1
    t.boolean "public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "step_ingredients", force: :cascade do |t|
    t.string "uuid", default: ""
    t.integer "recipe_step_id"
    t.integer "ingredient_id"
    t.integer "sequence_order", default: 0
    t.decimal "quantity", default: "0.0"
    t.integer "unit_id", default: 1
    t.string "instruction", default: ""
    t.string "color", default: "#a6cee3"
    t.boolean "is_sub_recipe", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "step_sub_recipes", force: :cascade do |t|
    t.string "uuid", default: ""
    t.integer "recipe_step_id"
    t.integer "sub_recipe_id"
    t.integer "sequence_order", default: 0
    t.decimal "quantity", default: "0.0"
    t.integer "unit_id", default: 1
    t.string "instruction", default: ""
    t.string "color", default: "#a6cee3"
    t.boolean "is_sub_recipe", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "uuid", default: ""
    t.string "name"
    t.decimal "gram_conversion_factor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid", default: ""
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
