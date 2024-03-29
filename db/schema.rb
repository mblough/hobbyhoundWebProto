# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150407140857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.boolean  "read"
    t.integer  "currentpage"
    t.integer  "totalpages"
    t.boolean  "reading"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "author"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "authorname"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.string   "system"
    t.boolean  "beaten"
    t.boolean  "playing"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.boolean  "watched"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "movies", ["user_id"], name: "index_movies_on_user_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.string   "name"
    t.string   "showtype"
    t.boolean  "finished"
    t.integer  "currentepisode"
    t.integer  "totalepisodes"
    t.boolean  "watching"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "shows", ["user_id"], name: "index_shows_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "picture"
    t.boolean  "private",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "books", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "games", "users"
  add_foreign_key "movies", "users"
  add_foreign_key "shows", "users"
end
