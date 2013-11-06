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

ActiveRecord::Schema.define(version: 20131106115517) do

  create_table "evaluation_forms", force: true do |t|
    t.string   "student_id"
    t.string   "preliminary_exam"
    t.string   "oral_exam"
    t.string   "thesis_proposal"
    t.text     "education"
    t.text     "classes_taken"
    t.text     "publications"
    t.text     "academic_activities"
    t.text     "researsh_progress"
    t.text     "plan"
    t.text     "suggestions"
    t.text     "comments"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "job"
    t.string "jobid"
    t.string "email"
  end

end
