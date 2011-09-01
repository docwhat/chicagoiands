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

ActiveRecord::Schema.define(:version => 20110827234141) do

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.text     "topic"
    t.text     "body"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "rendered"
    t.boolean  "has_dvd",    :default => false, :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "rendered"
  end

  create_table "textures", :force => true do |t|
    t.string   "label"
    t.text     "body"
    t.text     "rendered"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "logon"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
