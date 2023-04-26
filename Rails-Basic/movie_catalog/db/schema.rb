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

ActiveRecord::Schema[7.0].define(version: 2023_04_05_165609) do
  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_genre_id", default: 0, null: false
    t.index ["movie_genre_id"], name: "index_directors_on_movie_genre_id"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.string "synopsis"
    t.string "origin_country"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_genre_id", default: 0, null: false
    t.integer "director_id", default: 0, null: false
    t.boolean "released", default: true
    t.boolean "draft", default: false
    t.string "image_url", default: "https://via.placeholder.com/300x450"
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["movie_genre_id"], name: "index_movies_on_movie_genre_id"
  end

  add_foreign_key "directors", "movie_genres"
  add_foreign_key "movies", "directors"
  add_foreign_key "movies", "movie_genres"
end
