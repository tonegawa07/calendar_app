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

ActiveRecord::Schema.define(version: 2021_01_23_051201) do

  create_table "cn_reservations", force: :cascade do |t|
    t.string "lab"
    t.string "name"
    t.integer "number_of_samples"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "information"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sample_type"
    t.string "sample_weight"
    t.float "oxygen"
    t.float "argon"
  end

  create_table "icp_reservations", force: :cascade do |t|
    t.string "lab"
    t.string "name"
    t.integer "number_of_samples"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "information"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "argon_1"
    t.string "argon_2"
    t.string "argon_3"
    t.string "argon_4"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
  end

end
