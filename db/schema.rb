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

ActiveRecord::Schema[7.1].define(version: 2024_02_10_231042) do
  create_table "box_pokemons", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "pokemon_id", null: false
    t.boolean "main_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_box_pokemons_on_pokemon_id"
    t.index ["user_id"], name: "index_box_pokemons_on_user_id"
  end

  create_table "individual_pokemon_types", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "pokemon_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_individual_pokemon_types_on_pokemon_id"
    t.index ["pokemon_type_id"], name: "index_individual_pokemon_types_on_pokemon_type_id"
  end

  create_table "pokemon_books", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "pokemon_id", null: false
    t.boolean "get_flg", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_pokemon_books_on_pokemon_id"
    t.index ["user_id"], name: "index_pokemon_books_on_user_id"
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.string "type_image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_image"], name: "index_pokemon_types_on_type_image", unique: true
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "no", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pokemon_image", null: false
    t.string "pokemon_back_image", null: false
    t.index ["name"], name: "index_pokemons_on_name", unique: true
    t.index ["no"], name: "index_pokemons_on_no", unique: true
  end

  create_table "user_pokemon_matches", force: :cascade do |t|
    t.integer "match_score", default: 500, null: false
    t.integer "match_limit", default: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_user_pokemon_matches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "box_pokemons", "pokemons"
  add_foreign_key "box_pokemons", "users"
  add_foreign_key "individual_pokemon_types", "pokemon_types"
  add_foreign_key "individual_pokemon_types", "pokemons"
  add_foreign_key "pokemon_books", "pokemons"
  add_foreign_key "pokemon_books", "users"
  add_foreign_key "user_pokemon_matches", "users"
end
