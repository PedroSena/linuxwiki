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

ActiveRecord::Schema.define(version: 20140106125531) do

  create_table "commands", force: true do |t|
    t.string   "example"
    t.string   "explanation"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "commands_votes", id: false, force: true do |t|
    t.integer "command_id"
    t.integer "vote_id"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "command_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments_votes", id: false, force: true do |t|
    t.integer "comment_id"
    t.integer "vote_id"
  end

  create_table "users", force: true do |t|
    t.string   "openID"
    t.string   "email"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  create_table "users_votes", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "vote_id"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
