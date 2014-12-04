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

ActiveRecord::Schema.define(version: 20141204032603) do

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "date_assigned"
    t.datetime "date_due"
    t.integer  "points"
    t.integer  "course_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buddyships", force: true do |t|
    t.integer  "course_section_id"
    t.integer  "student_id"
    t.integer  "buddy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_sections", force: true do |t|
    t.integer  "course_teacher_assignment_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  create_table "course_teacher_assignments", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.integer  "school_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enemyships", force: true do |t|
    t.integer  "course_section_id"
    t.integer  "student_id"
    t.integer  "enemy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardians", force: true do |t|
    t.integer  "student_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "address"
    t.string   "email"
    t.string   "day_phone"
    t.string   "evening_phone"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.integer  "points_earned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_course_sections", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.integer  "school_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
