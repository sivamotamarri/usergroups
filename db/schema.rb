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

ActiveRecord::Schema.define(:version => 20121008085545) do

  create_table "chapter_members", :force => true do |t|
    t.integer  "chapter_id",   :null => false
    t.integer  "user_id",      :null => false
    t.string   "memeber_type"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "chapters", :force => true do |t|
    t.string   "name"
    t.string   "chapter_type"
    t.string   "chapter_status"
    t.string   "country_id"
    t.string   "state_id"
    t.string   "city_id"
    t.string   "locality"
    t.string   "address"
    t.string   "landmark"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fullname"
    t.integer  "created_by"
    t.string   "updated_by",             :limit => 10
    t.datetime "deleted_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
