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

ActiveRecord::Schema.define(version: 20170528072149) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "avatar"
    t.integer  "position"
    t.integer  "status",     limit: 1, default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "title",                            null: false
    t.string   "images"
    t.integer  "position"
    t.integer  "status",     limit: 1, default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "plant_id"
    t.string   "title",                            null: false
    t.text     "content"
    t.string   "photo"
    t.integer  "position"
    t.integer  "status",     limit: 1, default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["plant_id"], name: "index_pictures_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "title",                            null: false
    t.integer  "position"
    t.integer  "status",     limit: 1, default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trees", force: :cascade do |t|
    t.string   "name",                             null: false
    t.string   "title",                            null: false
    t.integer  "kind",       limit: 1, default: 0, null: false
    t.string   "pictures"
    t.integer  "position"
    t.integer  "status",     limit: 1, default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "role",            limit: 1, default: 0, null: false
    t.string   "last_name",                             null: false
    t.string   "first_name",                            null: false
    t.string   "email",                                 null: false
    t.string   "password_digest",                       null: false
    t.string   "remember_digest"
    t.integer  "status",          limit: 1, default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
