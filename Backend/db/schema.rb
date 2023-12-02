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

ActiveRecord::Schema[7.1].define(version: 2023_12_02_233944) do
  create_table "matches", force: :cascade do |t|
    t.integer "team_house_id", null: false
    t.integer "team_outside_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_house_id"], name: "index_matches_on_team_house_id"
    t.index ["team_outside_id"], name: "index_matches_on_team_outside_id"
  end

  create_table "soccer_players", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_soccer_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "victories"
    t.integer "loses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "teams", column: "team_house_id"
  add_foreign_key "matches", "teams", column: "team_outside_id"
  add_foreign_key "soccer_players", "teams"
end
