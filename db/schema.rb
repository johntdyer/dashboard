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

ActiveRecord::Schema.define(:version => 20110930211256) do

  create_table "browsers", :force => true do |t|
    t.string   "hostname"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "datacenter_id"
  end

  create_table "browsers_partition_platforms", :id => false, :force => true do |t|
    t.integer "browser_id"
    t.integer "partition_platform_id"
  end

  create_table "datacenters", :force => true do |t|
    t.string   "name"
    t.integer  "browser_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.integer  "platform_partition_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partition_platforms", :force => true do |t|
    t.integer  "ppid"
    t.string   "description"
    t.integer  "network_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
