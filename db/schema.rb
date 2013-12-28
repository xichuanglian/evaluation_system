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

ActiveRecord::Schema.define(version: 20131228060351) do

  create_table "academic_activity_infos", force: true do |t|
    t.date     "date"
    t.string   "activity_type"
    t.string   "details"
    t.string   "remark"
    t.integer  "student_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classes_taken_infos", force: true do |t|
    t.string   "course_number"
    t.string   "name"
    t.string   "instructor"
    t.string   "time"
    t.integer  "credits"
    t.integer  "score"
    t.string   "remark"
    t.integer  "student_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "education_infos", force: true do |t|
    t.date     "from"
    t.date     "to"
    t.string   "school"
    t.string   "remark"
    t.integer  "student_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evaluation_forms", force: true do |t|
    t.string   "name"
    t.string   "student_jobid"
    t.string   "student_type"
    t.string   "year"
    t.string   "thesis_advisor"
    t.string   "co_advisor"
    t.string   "official_advisor"
    t.string   "preliminary_exam"
    t.string   "oral_exam"
    t.string   "thesis_proposal"
    t.text     "education"
    t.text     "classes_taken"
    t.text     "publications"
    t.text     "academic_activities"
    t.text     "research_progress"
    t.text     "plan"
    t.text     "suggestions"
    t.text     "comments"
    t.integer  "grade"
    t.boolean  "form_submitted"
    t.boolean  "comment_submitted"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_infos", force: true do |t|
    t.string   "title"
    t.string   "co_authors"
    t.string   "pub_type"
    t.string   "name"
    t.integer  "year"
    t.string   "form"
    t.string   "remark"
    t.integer  "student_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", force: true do |t|
    t.string   "name"
    t.boolean  "open"
    t.datetime "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_profiles", force: true do |t|
    t.string   "preliminary_exam_subject"
    t.integer  "preliminary_exam_score"
    t.string   "oral_exam"
    t.string   "thesis_proposal"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "jobid"
    t.string   "email"
    t.string   "student_type"
    t.integer  "advisor_id"
    t.integer  "co_advisor_id"
    t.integer  "official_advisor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_settings", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "jobid"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usages", force: true do |t|
    t.string   "name"
    t.string   "entry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
