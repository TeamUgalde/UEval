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

ActiveRecord::Schema.define(version: 20150518210519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "flagged",          default: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "course_evaluations", force: :cascade do |t|
    t.integer  "difficulty"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_evaluations", ["course_id"], name: "index_course_evaluations_on_course_id", using: :btree
  add_index "course_evaluations", ["user_id"], name: "index_course_evaluations_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "overall_difficulty",  default: 0
    t.integer  "school_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "state",               default: "pending"
    t.integer  "creator_id"
    t.integer  "evaluation_quantity", default: 0
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id", using: :btree

  create_table "courses_professors", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "professor_id"
  end

  add_index "courses_professors", ["course_id"], name: "index_courses_professors_on_course_id", using: :btree
  add_index "courses_professors", ["professor_id"], name: "index_courses_professors_on_professor_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "subject"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "professor_evaluations", force: :cascade do |t|
    t.integer  "arrival_puntuality"
    t.integer  "feedback_puntuality"
    t.integer  "knowledge"
    t.integer  "addresses_questions"
    t.integer  "learning_interest"
    t.integer  "difficulty"
    t.integer  "clearness"
    t.integer  "respectful"
    t.string   "course_name"
    t.float    "overall_score"
    t.integer  "user_id"
    t.integer  "professor_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "professor_evaluations", ["professor_id"], name: "index_professor_evaluations_on_professor_id", using: :btree
  add_index "professor_evaluations", ["user_id"], name: "index_professor_evaluations_on_user_id", using: :btree

  create_table "professors", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.float    "overall_score"
    t.integer  "school_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "state",         default: "pending"
    t.integer  "creator_id"
  end

  add_index "professors", ["school_id"], name: "index_professors_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "schools", ["university_id"], name: "index_schools_on_university_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "banner"
    t.string   "webpage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                null: false
    t.string   "encrypted_password",     default: "",                null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "role",                   default: "usuario regular"
    t.string   "fullname"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                 null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
