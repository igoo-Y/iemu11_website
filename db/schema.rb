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

ActiveRecord::Schema.define(version: 2021_04_30_103300) do

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "view_count"
    t.integer "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["board_id"], name: "index_events_on_board_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_homes_on_user_id"
  end

  create_table "intros", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_intros_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "time"
    t.string "place"
    t.string "score"
    t.string "opponent"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "back_number"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "job"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "view_count"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "view_count"
    t.integer "news_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["news_id"], name: "index_notices_on_news_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "view_count"
    t.integer "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "user_name"
    t.index ["board_id"], name: "index_posts_on_board_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "rank"
    t.string "team_name"
    t.integer "match_count"
    t.integer "point"
    t.integer "win_count"
    t.integer "draw_count"
    t.integer "lose_count"
    t.integer "score_count"
    t.integer "lost_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "recent_form"
    t.integer "user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "view_count"
    t.integer "user_id"
    t.string "image_url"
  end

  add_foreign_key "boards", "users"
  add_foreign_key "events", "boards"
  add_foreign_key "homes", "users"
  add_foreign_key "intros", "users"
  add_foreign_key "matches", "users"
  add_foreign_key "news", "users"
  add_foreign_key "notices", "news"
  add_foreign_key "posts", "boards"
end
