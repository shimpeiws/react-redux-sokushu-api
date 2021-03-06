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

ActiveRecord::Schema.define(version: 20160609015215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "user_name"
    t.string   "content"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_comments_on_issue_id", using: :btree
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.integer  "status",      default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "content"
    t.integer  "assignee_id"
  end

  create_table "labelings", force: :cascade do |t|
    t.integer  "label_id"
    t.integer  "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_labelings_on_issue_id", using: :btree
    t.index ["label_id"], name: "index_labelings_on_label_id", using: :btree
  end

  create_table "labels", force: :cascade do |t|
    t.string   "name"
    t.string   "color_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "issues"
  add_foreign_key "labelings", "issues"
  add_foreign_key "labelings", "labels"
end
