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

ActiveRecord::Schema.define(version: 20180114114333) do

  create_table "admins", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "qualifications"
    t.string   "division"
    t.string   "pic"
    t.string   "designation"
    t.string   "namehref"
    t.string   "AOI"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "complete_projects", force: :cascade do |t|
    t.integer  "SelectedProject_id"
    t.integer  "Admin_id"
    t.string   "user1"
    t.string   "user2"
    t.string   "user3"
    t.string   "user4"
    t.string   "user5"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "complete_projects", ["Admin_id"], name: "index_complete_projects_on_Admin_id"
  add_index "complete_projects", ["SelectedProject_id"], name: "index_complete_projects_on_SelectedProject_id"

  create_table "project_user_admin_relations", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "user_id"
    t.integer  "SelectedProject_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id1"
    t.integer  "user_id2"
    t.integer  "user_id3"
    t.integer  "user_id4"
    t.integer  "user_id5"
  end

  add_index "project_user_admin_relations", ["SelectedProject_id"], name: "index_project_user_admin_relations_on_SelectedProject_id"
  add_index "project_user_admin_relations", ["admin_id"], name: "index_project_user_admin_relations_on_admin_id"
  add_index "project_user_admin_relations", ["user_id"], name: "index_project_user_admin_relations_on_user_id"

  create_table "selected_projects", force: :cascade do |t|
    t.string   "ProjectName"
    t.text     "Description"
    t.string   "email1"
    t.string   "email2"
    t.string   "email3"
    t.string   "email4"
    t.string   "email5"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "admin_id"
  end

  create_table "task_creates", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "branch"
    t.string   "percentage"
    t.string   "year"
    t.string   "task_name"
    t.string   "task_desc"
    t.integer  "members_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "email1"
    t.string   "email2"
    t.string   "email3"
    t.string   "email4"
    t.string   "email5"
    t.integer  "admin_id"
    t.boolean  "accepted"
  end

  create_table "user_task_relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_task_relations", ["task_id"], name: "index_user_task_relations_on_task_id"
  add_index "user_task_relations", ["user_id"], name: "index_user_task_relations_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "branch"
    t.string   "percentage"
    t.string   "year"
    t.string   "profile_pic"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
