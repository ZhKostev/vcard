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

ActiveRecord::Schema.define(:version => 20120925152929) do

  create_table "articles", :force => true do |t|
    t.integer  "original_id"
    t.string   "meta_description_ru"
    t.string   "title_ru"
    t.text     "short_description_ru"
    t.text     "body_ru"
    t.string   "meta_description_en"
    t.string   "title_en"
    t.text     "short_description_en"
    t.text     "body_en"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "slug"
    t.boolean  "has_russian_translation", :null => false
    t.boolean  "has_english_translation", :null => false
  end

  add_index "articles", ["original_id"], :name => "articles_front_version_id_index"
  add_index "articles", ["slug"], :name => "index_articles_on_slug"

  create_table "articles_connections", :force => true do |t|
    t.integer "article_a_id", :null => false
    t.integer "article_b_id", :null => false
  end

  add_index "articles_connections", ["article_a_id"], :name => "article_a_id_index"
  add_index "articles_connections", ["article_b_id"], :name => "article_b_id_index"

  create_table "articles_rubrics", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "rubric_id",  :null => false
  end

  add_index "articles_rubrics", ["article_id", "rubric_id"], :name => "index_articles_rubrics_on_article_id_and_rubric_id", :unique => true

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "rubrics", :force => true do |t|
    t.string   "title_en"
    t.string   "title_ru"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "rubrics", ["slug"], :name => "index_rubrics_on_slug"

  create_table "subscribes", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "language"
  end

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.string   "encrypted_password",  :default => "", :null => false
    t.datetime "remember_created_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
