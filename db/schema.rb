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

ActiveRecord::Schema.define(version: 2022_09_04_010011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "content"
    t.integer "position"
    t.bigint "kanban_small_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kanban_small_id"], name: "index_cards_on_kanban_small_id"
  end

  create_table "kanban_bigs", force: :cascade do |t|
    t.string "name"
    t.bigint "kanban_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kanban_id"], name: "index_kanban_bigs_on_kanban_id"
  end

  create_table "kanban_smalls", force: :cascade do |t|
    t.string "name"
    t.bigint "kanban_big_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kanban_big_id"], name: "index_kanban_smalls_on_kanban_big_id"
  end

  create_table "kanbans", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "kanban_smalls"
  add_foreign_key "kanban_bigs", "kanbans"
  add_foreign_key "kanban_smalls", "kanban_bigs"
end
