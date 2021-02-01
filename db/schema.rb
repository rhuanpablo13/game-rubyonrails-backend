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

ActiveRecord::Schema.define(version: 0) do

  create_table "collected_coins", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "value_coin", null: false
    t.index ["user_id"], name: "user_id"
  end

  create_table "deaths", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.timestamp "time_reg", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "user_id"
  end

  create_table "killed_monsters", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "monster_id", null: false
    t.index ["monster_id"], name: "monster_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "monsters", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 150
  end

  create_table "trophys", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 45
  end

  create_table "user_trophys", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "trophy_id", null: false
    t.index ["trophy_id"], name: "trophy_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "users", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 150
  end

  add_foreign_key "collected_coins", "users", name: "collected_coins_ibfk_1"
  add_foreign_key "deaths", "users", name: "deaths_ibfk_1"
  add_foreign_key "killed_monsters", "monsters", name: "killed_monsters_ibfk_2"
  add_foreign_key "killed_monsters", "users", name: "killed_monsters_ibfk_1"
  add_foreign_key "user_trophys", "trophys", name: "user_trophys_ibfk_2"
  add_foreign_key "user_trophys", "users", name: "user_trophys_ibfk_1"
end
