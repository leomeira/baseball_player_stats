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

ActiveRecord::Schema.define(version: 20170504115404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "divisions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "league_id"
    t.text     "name",       null: false
  end

  add_index "divisions", ["name", "league_id"], name: "index_divisions_on_name_and_league_id", unique: true, using: :btree

  create_table "leagues", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name",       null: false
  end

  add_index "leagues", ["name"], name: "index_leagues_on_name", unique: true, using: :btree

  create_table "players", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.float    "avg",             default: 0.0, null: false
    t.integer  "at_bats",         default: 0,   null: false
    t.integer  "caught_stealing", default: 0,   null: false
    t.integer  "doubles",         default: 0,   null: false
    t.integer  "games",           default: 0,   null: false
    t.integer  "games_started",   default: 0,   null: false
    t.text     "given_name",                    null: false
    t.integer  "hit_by_pitch",    default: 0,   null: false
    t.integer  "hits",            default: 0,   null: false
    t.integer  "home_runs",       default: 0,   null: false
    t.float    "ops",             default: 0.0, null: false
    t.integer  "pb",              default: 0,   null: false
    t.integer  "player_errors",   default: 0,   null: false
    t.integer  "position",        default: 0,   null: false
    t.integer  "rbi",             default: 0,   null: false
    t.integer  "runs",            default: 0,   null: false
    t.integer  "sacrifice_flies", default: 0,   null: false
    t.integer  "sacrifice_hits",  default: 0,   null: false
    t.integer  "steals",          default: 0,   null: false
    t.integer  "struck_out",      default: 0,   null: false
    t.text     "surname",                       null: false
    t.integer  "triples",         default: 0,   null: false
    t.integer  "walks",           default: 0,   null: false
  end

  add_index "players", ["surname", "given_name", "team_id"], name: "index_players_on_surname_and_given_name_and_team_id", unique: true, using: :btree

  create_table "seasons", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year",       null: false
  end

  add_index "seasons", ["year"], name: "index_seasons_on_year", unique: true, using: :btree

  create_table "seasons_leagues", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "season_id"
    t.integer  "league_id"
  end

  add_index "seasons_leagues", ["season_id", "league_id"], name: "index_seasons_leagues_on_season_id_and_league_id", unique: true, using: :btree

  create_table "teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "division_id"
    t.text     "name",        null: false
    t.text     "city",        null: false
  end

  add_index "teams", ["name"], name: "index_teams_on_name", unique: true, using: :btree

end
