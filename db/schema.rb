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

ActiveRecord::Schema.define(version: 20150618175443) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "continent"
    t.string   "place_id"
  end

  create_table "following", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "following_id"
  end

  add_index "following", ["user_id", "following_id"], name: "index_following_on_user_id_and_following_id"

  create_table "log_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "city_id"
  end

  add_index "log_posts", ["city_id"], name: "index_log_posts_on_city_id"
  add_index "log_posts", ["user_id"], name: "index_log_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
