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

ActiveRecord::Schema.define(version: 20170329143430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "lng"
    t.float    "lat"
    t.string   "address"
    t.index ["user_id"], name: "index_locations_on_user_id", using: :btree
  end

  create_table "match_rooms", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["receiver_id"], name: "index_match_rooms_on_receiver_id", using: :btree
    t.index ["sender_id"], name: "index_match_rooms_on_sender_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "match_room_id"
    t.index ["match_room_id"], name: "index_messages_on_match_room_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "about_me"
    t.text     "ideal_mate"
    t.text     "job"
    t.text     "religion"
    t.text     "hobbies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "personality"
    t.integer  "max_age"
    t.integer  "min_age"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "hair"
    t.string   "eye"
    t.string   "education"
    t.boolean  "kids"
    t.boolean  "date_kids"
    t.boolean  "want_kids"
    t.string   "politics"
    t.boolean  "date_politics"
    t.boolean  "smoke"
    t.boolean  "date_smoke"
    t.boolean  "tattoo"
    t.boolean  "date_tattoo"
    t.string   "religion"
    t.boolean  "date_religion"
    t.boolean  "pet"
    t.boolean  "date_pet"
    t.date     "birthday"
    t.index ["user_id"], name: "index_user_infos_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "sex"
    t.string   "orientation"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "photo"
  end

  add_foreign_key "locations", "users"
  add_foreign_key "messages", "match_rooms"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_infos", "users"
end
