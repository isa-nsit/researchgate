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

ActiveRecord::Schema.define(version: 20180204161931) do

  PRAGMA FOREIGN_KEYS = ON;
  create_table "accepted_workers", force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_admins_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_admins_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "name"
    t.string   "qualifications"
    t.string   "division"
    t.string   "pic"
    t.string   "designation"
    t.string   "namehref"
    t.string   "AOI"
  end

  create_table "selected_projects", force: :cascade do |t|
    t.string   "ProjectName"
    t.text     "Description"
    t.string   "email1"
    t.string   "email2"
    t.string   "email3"
    t.string   "email4"
    t.string   "email5"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "complete_projects", force: :cascade do |t|
    t.integer  "selected_projects_id", :index=>{:name=>"index_complete_projects_on_selected_projects_id"}, :foreign_key=>{:references=>"selected_projects", :name=>"fk_complete_projects_selected_projects_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "admin_id",             :index=>{:name=>"index_complete_projects_on_admin_id"}, :foreign_key=>{:references=>"admins", :name=>"fk_complete_projects_admin_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.string   "user1"
    t.string   "user2"
    t.string   "user3"
    t.string   "user4"
    t.string   "user5"
    t.datetime "created_at",           :null=>false
    t.datetime "updated_at",           :null=>false
  end

  create_table "eligibilities", force: :cascade do |t|
    t.string   "percentage"
    t.integer  "sems_complete"
    t.string   "branch"
    t.string   "period"
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
    t.string   "faculty_name"
  end

  create_table "incharges", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_incharges_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_incharges_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "name"
    t.string   "branch"
    t.string   "percentage"
    t.string   "year"
    t.string   "profile_pic"
  end

  create_table "project_user_admin_relations", force: :cascade do |t|
    t.integer  "admin_id",             :index=>{:name=>"index_project_user_admin_relations_on_admin_id"}, :foreign_key=>{:references=>"admins", :name=>"fk_project_user_admin_relations_admin_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "user_id",              :index=>{:name=>"index_project_user_admin_relations_on_user_id"}, :foreign_key=>{:references=>"users", :name=>"fk_project_user_admin_relations_user_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "selected_projects_id", :index=>{:name=>"index_project_user_admin_relations_on_selected_projects_id"}, :foreign_key=>{:references=>"selected_projects", :name=>"fk_project_user_admin_relations_selected_projects_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.datetime "created_at",           :null=>false
    t.datetime "updated_at",           :null=>false
    t.integer  "user_id1"
    t.integer  "user_id2"
    t.integer  "user_id3"
    t.integer  "user_id4"
    t.integer  "user_id5"
  end

  create_table "rejected_workers", force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "send_task_workers", force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "task_creates", force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "branch"
    t.string   "percentage"
    t.string   "year"
    t.string   "task_name"
    t.string   "task_desc"
    t.integer  "members_count"
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
    t.string   "email1"
    t.string   "email2"
    t.string   "email3"
    t.string   "email4"
    t.string   "email5"
    t.boolean  "accepted"
    t.integer  "update_count",  :default=>0
  end

  create_table "user_task_relations", force: :cascade do |t|
    t.integer  "user_id",    :index=>{:name=>"index_user_task_relations_on_user_id"}, :foreign_key=>{:references=>"users", :name=>"fk_user_task_relations_user_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "task_id",    :index=>{:name=>"index_user_task_relations_on_task_id"}, :foreign_key=>{:references=>"tasks", :name=>"fk_user_task_relations_task_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

end
