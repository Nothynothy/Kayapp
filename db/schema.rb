# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_01_121907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "category"
    t.boolean "active"
    t.string "alert_type"
    t.string "description"
    t.string "severity"
    t.bigint "user_id"
    t.bigint "topo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topo_id"], name: "index_comments_on_topo_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "topo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topo_id"], name: "index_favorites_on_topo_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "difficulty"
    t.bigint "topo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topo_id"], name: "index_levels_on_topo_id"
  end

  create_table "rivers", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "region"
    t.string "department"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "topos", force: :cascade do |t|
    t.string "name"
    t.string "length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "river_id"
    t.bigint "departure_id"
    t.bigint "arrival_id"
    t.string "image_url"
    t.index ["arrival_id"], name: "index_topos_on_arrival_id"
    t.index ["departure_id"], name: "index_topos_on_departure_id"
    t.index ["river_id"], name: "index_topos_on_river_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.integer "level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "topos"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "topos"
  add_foreign_key "favorites", "users"
  add_foreign_key "levels", "topos"
  add_foreign_key "topos", "addresses", column: "arrival_id"
  add_foreign_key "topos", "addresses", column: "departure_id"
  add_foreign_key "topos", "rivers"
end
