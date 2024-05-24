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

ActiveRecord::Schema[7.0].define(version: 2024_05_24_063722) do
  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_movies", force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_actors_movies_on_actor_id"
    t.index ["movie_id", "actor_id"], name: "index_actors_movies_on_movie_id_and_actor_id", unique: true
    t.index ["movie_id"], name: "index_actors_movies_on_movie_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations_movies", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_locations_movies_on_location_id"
    t.index ["movie_id", "location_id"], name: "index_locations_movies_on_movie_id_and_location_id", unique: true
    t.index ["movie_id"], name: "index_locations_movies_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "movie"
    t.text "description"
    t.integer "year"
    t.string "director"
    t.string "actor"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "movie"
    t.string "user"
    t.integer "stars"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id", null: false
    t.index ["movie_id", "user"], name: "index_reviews_on_movie_id_and_user", unique: true
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

  add_foreign_key "actors_movies", "actors"
  add_foreign_key "actors_movies", "movies"
  add_foreign_key "locations_movies", "actors", column: "location_id"
  add_foreign_key "locations_movies", "movies"
  add_foreign_key "reviews", "movies"
end
