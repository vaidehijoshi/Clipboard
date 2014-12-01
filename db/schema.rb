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

ActiveRecord::Schema.define(version: 20141201203642) do

  create_table "absences", force: true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.datetime "date"
    t.boolean  "excused",    default: false
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.string   "type"
    t.datetime "date_assigned"
    t.datetime "date_due"
    t.integer  "total_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.integer  "points_earned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardians", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.string   "day_phone"
    t.string   "evening_phone"
    t.string   "address"
    t.string   "relationship"
    t.boolean  "primary_contact"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_students", force: true do |t|
    t.integer  "section_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "grade_level"
    t.integer  "class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tardies", force: true do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.datetime "date"
    t.boolean  "excused",    default: false
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_buddies", force: true do |t|
    t.integer "buddy_one_id"
    t.integer "buddy_two_id"
    t.string  "comments"
  end

  create_table "work_enemies", force: true do |t|
    t.integer  "enemy_one_id"
    t.integer  "enemy_two_id"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
