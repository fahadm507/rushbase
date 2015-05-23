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

ActiveRecord::Schema.define(version: 20150523031404) do

  create_table "comments", force: true do |t|
    t.text     "description",    null: false
    t.integer  "meetup_post_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_comments", force: true do |t|
    t.string   "description", null: false
    t.integer  "user_id",     null: false
    t.integer  "post_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_posts", force: true do |t|
    t.string   "title"
    t.string   "description", null: false
    t.integer  "user_id",     null: false
    t.integer  "course_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_reviews", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name",            null: false
    t.string   "description",     null: false
    t.integer  "organization_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "banner_image"
    t.string   "course_link"
  end

  create_table "current_courses", force: true do |t|
    t.string  "name"
    t.string  "organization"
    t.integer "user_id"
  end

  add_index "current_courses", ["name"], name: "index_current_courses_on_name"
  add_index "current_courses", ["organization"], name: "index_current_courses_on_organization"
  add_index "current_courses", ["user_id", "name", "organization"], name: "index_current_courses_on_user_id_and_name_and_organization", unique: true
  add_index "current_courses", ["user_id"], name: "index_current_courses_on_user_id"

  create_table "educations", force: true do |t|
    t.string  "degree"
    t.string  "organization"
    t.text    "key_courses"
    t.integer "user_id"
    t.integer "year"
    t.boolean "graduated"
  end

  create_table "favorites", force: true do |t|
    t.string   "user_id"
    t.string   "user_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "future_courses", force: true do |t|
    t.string   "name",         null: false
    t.string   "organization"
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "future_courses", ["name"], name: "index_future_courses_on_name"
  add_index "future_courses", ["organization"], name: "index_future_courses_on_organization"
  add_index "future_courses", ["user_id", "name", "organization"], name: "index_future_courses_on_user_id_and_name_and_organization", unique: true
  add_index "future_courses", ["user_id"], name: "index_future_courses_on_user_id"

  create_table "industries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", force: true do |t|
    t.integer  "organization_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetup_members", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "meetup_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetup_members", ["meetup_id"], name: "index_meetup_members_on_meetup_id"
  add_index "meetup_members", ["user_id", "meetup_id"], name: "index_meetup_members_on_user_id_and_meetup_id", unique: true
  add_index "meetup_members", ["user_id"], name: "index_meetup_members_on_user_id"

  create_table "meetup_post_comments", force: true do |t|
    t.text     "description",    null: false
    t.integer  "meetup_post_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetup_post_votes", force: true do |t|
    t.integer  "user_id",        null: false
    t.integer  "meetup_post_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetup_post_votes", ["meetup_post_id", "user_id"], name: "index_meetup_post_votes_on_meetup_post_id_and_user_id", unique: true
  add_index "meetup_post_votes", ["meetup_post_id"], name: "index_meetup_post_votes_on_meetup_post_id"
  add_index "meetup_post_votes", ["user_id"], name: "index_meetup_post_votes_on_user_id"

  create_table "meetup_posts", force: true do |t|
    t.string   "title"
    t.text     "description", null: false
    t.integer  "meetup_id",   null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.text     "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "banner_image"
    t.string   "provider"
    t.string   "course_link"
    t.integer  "course_id"
  end

  create_table "organizations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
  end

  create_table "post_comments", force: true do |t|
    t.string   "body",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_post_id"
    t.integer  "user_id"
  end

  create_table "resources", force: true do |t|
    t.string  "name"
    t.string  "organization"
    t.integer "user_id"
  end

  create_table "taken_courses", force: true do |t|
    t.string  "name"
    t.string  "organization"
    t.integer "user_id"
  end

  add_index "taken_courses", ["name"], name: "index_taken_courses_on_name"
  add_index "taken_courses", ["organization"], name: "index_taken_courses_on_organization"
  add_index "taken_courses", ["user_id", "name", "organization"], name: "index_taken_courses_on_user_id_and_name_and_organization", unique: true
  add_index "taken_courses", ["user_id"], name: "index_taken_courses_on_user_id"

  create_table "team_members", force: true do |t|
    t.integer "user_id"
    t.integer "user_team_id"
  end

  create_table "upvotes", force: true do |t|
    t.integer  "user_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_post_id"
  end

  add_index "upvotes", ["user_id"], name: "index_upvotes_on_meetup_post_id_and_user_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_post_id_and_user_id", unique: true

  create_table "user_posts", force: true do |t|
    t.text     "description", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_teams", force: true do |t|
    t.string  "name"
    t.text    "About"
    t.text    "goal"
    t.text    "requirements"
    t.integer "user_id"
    t.integer "course_id"
    t.boolean "private",      default: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.text     "interests"
    t.integer  "industry_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "location_id"
    t.boolean  "admin"
    t.string   "full_name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
