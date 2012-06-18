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

ActiveRecord::Schema.define(:version => 20120614182939) do

  create_table "articles", :force => true do |t|
    t.integer  "front_version_id"
    t.string   "meta_title_ru"
    t.string   "meta_description_ru"
    t.string   "meta_keywords_ru"
    t.string   "title_ru"
    t.text     "short_description_ru"
    t.text     "body_ru"
    t.string   "meta_title_en"
    t.string   "meta_description_en"
    t.string   "meta_keywords_en"
    t.string   "title_en"
    t.text     "short_description_en"
    t.text     "body_en"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["front_version_id"], :name => "articles_front_version_id_index"

  create_table "rubrics", :force => true do |t|
    t.string   "title_en"
    t.string   "title_ru"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
