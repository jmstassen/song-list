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

ActiveRecord::Schema.define(version: 2021_04_09_225239) do

  create_table "lines", force: :cascade do |t|
    t.text "lyrics"
    t.string "chords"
    t.integer "line_number"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_lines_on_song_id"
  end

  create_table "setlist_permissions", force: :cascade do |t|
    t.integer "permission"
    t.integer "user_id"
    t.integer "setlist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["setlist_id"], name: "index_setlist_permissions_on_setlist_id"
    t.index ["user_id"], name: "index_setlist_permissions_on_user_id"
  end

  create_table "setlists", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.date "date"
    t.boolean "public"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "song_selections", force: :cascade do |t|
    t.integer "song_number"
    t.integer "song_id"
    t.integer "setlist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["setlist_id"], name: "index_song_selections_on_setlist_id"
    t.index ["song_id"], name: "index_song_selections_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "songwriter"
    t.string "tempo"
    t.string "key"
    t.text "note"
    t.string "link"
    t.boolean "public"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "display_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "lines", "songs"
  add_foreign_key "setlist_permissions", "setlists"
  add_foreign_key "setlist_permissions", "users"
  add_foreign_key "song_selections", "setlists"
  add_foreign_key "song_selections", "songs"
  add_foreign_key "songs", "users"
end
