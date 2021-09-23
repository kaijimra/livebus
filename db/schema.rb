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

ActiveRecord::Schema.define(version: 2021_09_22_163749) do

  create_table "bus_plans", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "bus_id", null: false
    t.bigint "stop_id", null: false
    t.time "arrv_time"
    t.time "dept_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_id"], name: "index_bus_plans_on_bus_id"
    t.index ["stop_id"], name: "index_bus_plans_on_stop_id"
  end

  create_table "buses", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "follow_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "stops", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trip_plans", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bus_id", null: false
    t.bigint "orig_stop_id", null: false
    t.bigint "dest_stop_id", null: false
    t.time "sched_dest_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_id"], name: "index_trip_plans_on_bus_id"
    t.index ["dest_stop_id"], name: "index_trip_plans_on_dest_stop_id"
    t.index ["orig_stop_id"], name: "index_trip_plans_on_orig_stop_id"
    t.index ["user_id"], name: "index_trip_plans_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bus_plans", "buses"
  add_foreign_key "bus_plans", "stops"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
  add_foreign_key "trip_plans", "buses"
  add_foreign_key "trip_plans", "stops", column: "dest_stop_id"
  add_foreign_key "trip_plans", "stops", column: "orig_stop_id"
  add_foreign_key "trip_plans", "users"
end
