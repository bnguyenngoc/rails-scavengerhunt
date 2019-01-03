# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_102_224_403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'challenges', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.text 'judgenote'
    t.integer 'score'
    t.string 'keyword'
    t.boolean 'published', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'challenge_type', default: 0
  end

  create_table 'team_challenges', force: :cascade do |t|
    t.bigint 'team_id'
    t.bigint 'challenge_id'
    t.integer 'score', default: 0
    t.text 'submission'
    t.integer 'status'
    t.boolean 'done'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['challenge_id'], name: 'index_team_challenges_on_challenge_id'
    t.index ['team_id'], name: 'index_team_challenges_on_team_id'
  end

  create_table 'team_relationships', force: :cascade do |t|
    t.bigint 'team_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['team_id'], name: 'index_team_relationships_on_team_id'
    t.index ['user_id'], name: 'index_team_relationships_on_user_id'
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name'
    t.text 'tagline'
    t.text 'url'
    t.bigint 'captain_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['captain_id'], name: 'index_teams_on_captain_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role', default: 1
  end

  add_foreign_key 'team_challenges', 'challenges'
  add_foreign_key 'team_challenges', 'teams'
  add_foreign_key 'team_relationships', 'teams'
  add_foreign_key 'team_relationships', 'users'
  add_foreign_key 'teams', 'users', column: 'captain_id'
end
