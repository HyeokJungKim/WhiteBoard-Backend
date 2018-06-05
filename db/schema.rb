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

ActiveRecord::Schema.define(version: 2018_06_05_141735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "description"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_assignments_on_classroom_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.bigint "teacher_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_classrooms_on_student_id"
    t.index ["teacher_id"], name: "index_classrooms_on_teacher_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grade"
    t.bigint "assignment_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_grades_on_assignment_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_schedules_on_classroom_id"
    t.index ["student_id"], name: "index_schedules_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "avatar"
    t.string "username"
    t.string "password_digest"
    t.boolean "is_account", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "classrooms"
  add_foreign_key "classrooms", "students"
  add_foreign_key "classrooms", "teachers"
  add_foreign_key "grades", "assignments"
  add_foreign_key "grades", "students"
  add_foreign_key "schedules", "classrooms"
  add_foreign_key "schedules", "students"
end
