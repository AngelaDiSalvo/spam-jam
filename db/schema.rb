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

ActiveRecord::Schema.define(version: 2018_08_20_213221) do

  create_table "emails", force: :cascade do |t|
    t.string "contents"
    t.integer "user_id"
    t.integer "victim_id"
    t.integer "spam_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spam_type_id"], name: "index_emails_on_spam_type_id"
    t.index ["user_id"], name: "index_emails_on_user_id"
    t.index ["victim_id"], name: "index_emails_on_victim_id"
  end

  create_table "fake_emails", force: :cascade do |t|
    t.string "email"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fake_emails_on_user_id"
  end

  create_table "spam_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "real_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "victims", force: :cascade do |t|
    t.string "name"
    t.string "real_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
