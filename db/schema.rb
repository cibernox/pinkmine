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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120508211058) do

  create_table "issues", :force => true do |t|
    t.string   "title",                        :null => false
    t.string   "code",           :limit => 10, :null => false
    t.text     "description",                  :null => false
    t.integer  "project_id",                   :null => false
    t.string   "status"
    t.integer  "percentage"
    t.integer  "creator_id",                   :null => false
    t.integer  "responsable_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "priority"
  end

  create_table "projects", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "creator_id",     :null => false
    t.integer  "responsable_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                     :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_me_token"
    t.string   "name"
    t.string   "surname1"
    t.string   "surname2"
    t.date     "born_on"
    t.string   "twitter"
    t.string   "github"
    t.boolean  "accepts_conditions"
    t.datetime "remember_me_token_expires_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
