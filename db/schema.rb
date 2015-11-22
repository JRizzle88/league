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

ActiveRecord::Schema.define(version: 20151119210705) do

  create_table "champions", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.boolean  "free"
    t.boolean  "ranked"
    t.integer  "armor"
    t.integer  "armorperlevel"
    t.integer  "attackdamage"
    t.integer  "attackdamageperlevel"
    t.integer  "attackrange"
    t.integer  "attackspeedoffset"
    t.integer  "attackspeedperlevel"
    t.integer  "crit"
    t.integer  "critperlevel"
    t.integer  "hp"
    t.integer  "hpperlevel"
    t.integer  "hpregen"
    t.integer  "hpregenperlevel"
    t.integer  "movespeed"
    t.integer  "mp"
    t.integer  "mpperlevel"
    t.integer  "mpregen"
    t.integer  "mpregenperlevel"
    t.integer  "spellblock"
    t.integer  "spellblockperlevel"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "masteries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.integer  "champion_id"
    t.string   "name"
    t.string   "description"
    t.string   "cost"
    t.string   "cooldown"
    t.string   "range"
    t.string   "key"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "summoners", force: :cascade do |t|
    t.string   "name"
    t.integer  "icon"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
