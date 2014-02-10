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

ActiveRecord::Schema.define(:version => 20140210091236) do

  create_table "attendances", :force => true do |t|
    t.integer  "userid"
    t.date     "date"
    t.time     "reachtime"
    t.time     "leavetime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "timetables", :force => true do |t|
    t.integer  "jplevel"
    t.string   "classname"
    t.string   "school"
    t.time     "starttime"
    t.time     "endtime"
    t.boolean  "sunday"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturaday"
    t.float    "duration"
    t.date     "startdate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "travelfees", :force => true do |t|
    t.integer  "userid"
    t.string   "classname"
    t.date     "date"
    t.integer  "travel_fee"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "userid"
    t.string   "name"
    t.date     "dob"
    t.string   "address"
    t.integer  "phone"
    t.integer  "normaltravelfee"
    t.boolean  "gender"
    t.string   "team"
    t.string   "NRCNumber"
    t.integer  "year_of_entry"
    t.date     "date_of_entry"
    t.integer  "leaveday"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
