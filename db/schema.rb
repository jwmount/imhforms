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

ActiveRecord::Schema.define(version: 20141115002355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "developmental_levels", force: true do |t|
    t.integer  "student_id"
    t.date     "observed_on"
    t.string   "recorder"
    t.integer  "duration"
    t.integer  "facilitated_by_adult",  default: 0
    t.integer  "initiated_by_child",    default: 0
    t.integer  "sensory_motor",         default: 0
    t.integer  "pleasure",              default: 0
    t.integer  "displeasure",           default: 0
    t.integer  "with_object",           default: 0
    t.integer  "sensory_motor_play",    default: 0
    t.integer  "representational_play", default: 0
    t.integer  "with_adult_support",    default: 0
    t.integer  "independently",         default: 0
    t.integer  "cross_context_1",       default: 0
    t.integer  "cross_context_2",       default: 0
    t.integer  "cross_context_3",       default: 0
    t.integer  "cross_context_4",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observations", force: true do |t|
    t.integer  "student_id"
    t.datetime "observed_on"
    t.string   "grade"
    t.string   "teacher"
    t.string   "allergies"
    t.string   "diet"
    t.string   "sleep"
    t.string   "elimination"
    t.string   "concerns"
    t.string   "stability"
    t.string   "parent_histories"
    t.string   "household_members"
    t.string   "community_supports"
    t.string   "interaction_patterns"
    t.string   "well_attuned"
    t.string   "avoidant"
    t.string   "vigilant"
    t.string   "over_stimulating"
    t.string   "sensory_registration"
    t.string   "sensory_orientation"
    t.string   "sensory_interpretation"
    t.string   "response_organization"
    t.string   "response_execution"
    t.string   "adaptability"
    t.string   "sensory_threshold"
    t.string   "sensory_seeking_behaviors"
    t.string   "shares_attention"
    t.string   "regulation"
    t.string   "engagement"
    t.string   "interactions"
    t.string   "individuation"
    t.string   "mood"
    t.string   "solves_problems"
    t.string   "imagination"
    t.string   "creativity"
    t.string   "reasoning"
    t.string   "links_emotions"
    t.string   "perspective"
    t.string   "multiCausal_thinking"
    t.string   "selfReflective_thinking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "recorder"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.date     "born_on",    default: '2003-01-01', null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
