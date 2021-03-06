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

ActiveRecord::Schema.define(version: 20170904132539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "authors"
    t.string "publisher"
    t.string "yop"
    t.text "description"
    t.integer "page_count"
    t.string "small_thumbnail"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "isbn"
    t.integer "total_count"
    t.integer "available"
  end

  create_table "books_users", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id", "book_id"], name: "index_books_users_on_user_id_and_book_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "message"
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["recipient_id"], name: "index_notifications_on_recipient_id"
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "notifications_users", id: false, force: :cascade do |t|
    t.bigint "notification_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notifications", "users"
end
