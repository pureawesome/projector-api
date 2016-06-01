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

ActiveRecord::Schema.define(version: 20160527191839) do

  create_table "api_keys", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", using: :btree

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.integer  "resource_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
  end

  add_index "bookings", ["project_id"], name: "index_bookings_on_project_id", using: :btree
  add_index "bookings", ["resource_id"], name: "index_bookings_on_resource_id", using: :btree

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",        limit: 65535
    t.datetime "start_date"
    t.datetime "projected_end_date"
    t.date     "actual_end_date"
    t.decimal  "budget",                           precision: 9, scale: 2
    t.decimal  "cost",                             precision: 9, scale: 2
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  create_table "resources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "start_date"
    t.datetime "due_date"
    t.integer  "status"
    t.integer  "project_id"
    t.integer  "projects_id"
    t.integer  "user_id"
    t.integer  "users_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tasks", ["projects_id"], name: "index_tasks_on_projects_id", using: :btree
  add_index "tasks", ["users_id"], name: "index_tasks_on_users_id", using: :btree

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_foreign_key "bookings", "projects"
  add_foreign_key "bookings", "resources"
  add_foreign_key "tasks", "projects", column: "projects_id"
  add_foreign_key "tasks", "users", column: "users_id"
end
