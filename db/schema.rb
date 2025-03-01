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

ActiveRecord::Schema[7.0].define(version: 2024_12_15_013610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sessions_fields", force: :cascade do |t|
    t.bigint "game_sessions_game_row_id"
    t.integer "position", null: false
    t.integer "value", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_sessions_game_row_id"], name: "index_game_sessions_fields_on_game_sessions_game_row_id"
  end

  create_table "game_sessions_game_rows", force: :cascade do |t|
    t.bigint "game_sessions_game_id"
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_sessions_game_id"], name: "index_game_sessions_game_rows_on_game_sessions_game_id"
  end

  create_table "game_sessions_games", force: :cascade do |t|
    t.bigint "game_sessions_session_row_id"
    t.integer "position", null: false
    t.integer "value", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_sessions_session_row_id"], name: "index_game_sessions_games_on_game_sessions_session_row_id"
  end

  create_table "game_sessions_moves", force: :cascade do |t|
    t.bigint "game_sessions_player_id", null: false
    t.bigint "game_sessions_session_id", null: false
    t.bigint "game_sessions_field_id", null: false
    t.integer "value", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_sessions_field_id"], name: "index_game_sessions_moves_on_game_sessions_field_id"
    t.index ["game_sessions_player_id"], name: "index_game_sessions_moves_on_game_sessions_player_id"
    t.index ["game_sessions_session_id"], name: "index_game_sessions_moves_on_game_sessions_session_id"
  end

  create_table "game_sessions_players", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_sessions_session_id"
    t.integer "figure", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_sessions_session_id"], name: "index_game_sessions_players_on_game_sessions_session_id"
    t.index ["user_id"], name: "index_game_sessions_players_on_user_id"
  end

  create_table "game_sessions_session_rows", force: :cascade do |t|
    t.bigint "game_sessions_session_id"
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_sessions_session_id"], name: "index_game_sessions_session_rows_on_game_sessions_session_id"
  end

  create_table "game_sessions_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "secret", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_game_sessions_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_sessions_moves", "game_sessions_fields"
  add_foreign_key "game_sessions_moves", "game_sessions_players"
  add_foreign_key "game_sessions_moves", "game_sessions_sessions"
  add_foreign_key "game_sessions_players", "users"
  add_foreign_key "game_sessions_sessions", "users"
end
