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

  create_table "collected_coin", primary_key: "ID", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "VALUE_COIN", null: false
    t.index ["USER_ID"], name: "USER_ID"
  end

  create_table "deaths", primary_key: "ID", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.timestamp "TIME_REG", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["USER_ID"], name: "USER_ID"
  end

  create_table "killed_monster", primary_key: "ID", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "MONSTER_ID", null: false
    t.index ["MONSTER_ID"], name: "MONSTER_ID"
    t.index ["USER_ID"], name: "USER_ID"
  end

  create_table "monsters", primary_key: "ID", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "NAME", limit: 150
  end

  create_table "trophy", primary_key: "ID", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "NAME", limit: 45
  end

  create_table "user_trophy", primary_key: "ID", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "TROPHY_ID", null: false
    t.index ["TROPHY_ID"], name: "TROPHY_ID"
    t.index ["USER_ID"], name: "USER_ID"
  end

  create_table "users", primary_key: "ID", id: :integer, charset: "utf8", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "NAME", limit: 150
  end

  add_foreign_key "collected_coin", "users", column: "USER_ID", primary_key: "ID", name: "collected_coin_ibfk_1"
  add_foreign_key "deaths", "users", column: "USER_ID", primary_key: "ID", name: "deaths_ibfk_1"
  add_foreign_key "killed_monster", "monsters", column: "MONSTER_ID", primary_key: "ID", name: "killed_monster_ibfk_2"
  add_foreign_key "killed_monster", "users", column: "USER_ID", primary_key: "ID", name: "killed_monster_ibfk_1"
  add_foreign_key "user_trophy", "trophy", column: "TROPHY_ID", primary_key: "ID", name: "user_trophy_ibfk_2"
  add_foreign_key "user_trophy", "users", column: "USER_ID", primary_key: "ID", name: "user_trophy_ibfk_1"
end
