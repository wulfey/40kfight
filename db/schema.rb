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

ActiveRecord::Schema.define(version: 20170709222610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attack_groups", force: :cascade do |t|
    t.integer  "simulation_id"
    t.text     "attacker"
    t.text     "target"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["simulation_id"], name: "index_attack_groups_on_simulation_id", using: :btree
  end

  create_table "datasheets", force: :cascade do |t|
    t.text     "name"
    t.text     "role"
    t.integer  "power"
    t.integer  "movement"
    t.integer  "shooting_skill"
    t.integer  "strength"
    t.integer  "combat_skill"
    t.integer  "attacks"
    t.integer  "wounds"
    t.integer  "leadership"
    t.integer  "armor_save"
    t.integer  "invul_shooting"
    t.integer  "invul_combat"
    t.integer  "single_model_point_cost"
    t.integer  "model_count_increment"
    t.integer  "power_for_each_increment"
    t.integer  "min_model_count"
    t.integer  "max_model_count"
    t.integer  "slots",                    default: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "toughness",                default: 4
    t.integer  "fnp",                      default: 7
    t.text     "faction_keywords",         default: [],              array: true
    t.text     "keywords",                 default: [],              array: true
    t.integer  "leaderAttacks",            default: 1
    t.text     "abilities",                default: [],              array: true
  end

  create_table "datasheets_simulations", id: false, force: :cascade do |t|
    t.integer "simulation_id"
    t.integer "datasheet_id"
    t.index ["datasheet_id"], name: "index_datasheets_simulations_on_datasheet_id", using: :btree
    t.index ["simulation_id"], name: "index_datasheets_simulations_on_simulation_id", using: :btree
  end

  create_table "detachments", force: :cascade do |t|
    t.text     "name"
    t.integer  "command_points"
    t.integer  "min_troops"
    t.integer  "min_elites"
    t.integer  "min_fast"
    t.integer  "min_heavy"
    t.integer  "min_hq"
    t.integer  "min_lord"
    t.integer  "min_flyer"
    t.boolean  "dedicated_allowed"
    t.integer  "max_troops"
    t.integer  "max_elites"
    t.integer  "max_fast"
    t.integer  "max_heavy"
    t.integer  "max_hq"
    t.integer  "max_lord"
    t.integer  "max_flyer"
    t.integer  "cur_troops"
    t.integer  "cur_elites"
    t.integer  "cur_fast"
    t.integer  "cur_heavy"
    t.integer  "cur_hq"
    t.integer  "cur_lord"
    t.integer  "cur_flyer"
    t.integer  "list_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["list_id"], name: "index_detachments_on_list_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.text     "name"
    t.boolean  "private"
    t.integer  "used_points"
    t.integer  "available_points"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "results", force: :cascade do |t|
    t.integer  "simulation_id"
    t.string   "attacker"
    t.string   "target"
    t.integer  "woundsdealt",     default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "results_array",   default: [],              array: true
    t.integer  "hitCount",        default: 0
    t.integer  "woundCount",      default: 0
    t.text     "weaponName"
    t.integer  "failedSaves",     default: 0
    t.integer  "kills",           default: 0
    t.integer  "slot",            default: 1
    t.integer  "attack_group_id"
    t.index ["attack_group_id"], name: "index_results_on_attack_group_id", using: :btree
    t.index ["simulation_id"], name: "index_results_on_simulation_id", using: :btree
  end

  create_table "simulations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "resulttext", default: [],              array: true
    t.index ["user_id"], name: "index_simulations_on_user_id", using: :btree
  end

  create_table "simulations_datasheets", id: false, force: :cascade do |t|
    t.integer "simulation_id"
    t.integer "datasheet_id"
    t.index ["datasheet_id"], name: "index_simulations_datasheets_on_datasheet_id", using: :btree
    t.index ["simulation_id"], name: "index_simulations_datasheets_on_simulation_id", using: :btree
  end

  create_table "simulations_units", id: false, force: :cascade do |t|
    t.integer "simulation_id"
    t.integer "unit_id"
    t.index ["simulation_id"], name: "index_simulations_units_on_simulation_id", using: :btree
    t.index ["unit_id"], name: "index_simulations_units_on_unit_id", using: :btree
  end

  create_table "units", force: :cascade do |t|
    t.text     "name"
    t.text     "role"
    t.integer  "power"
    t.integer  "movement"
    t.integer  "shooting_skill"
    t.integer  "strength"
    t.integer  "combat_skill"
    t.integer  "attacks"
    t.integer  "wounds"
    t.integer  "leadership"
    t.integer  "armor_save"
    t.integer  "invul_shooting"
    t.integer  "invul_combat"
    t.integer  "single_model_point_cost"
    t.integer  "model_count_increment"
    t.integer  "power_for_each_increment"
    t.integer  "min_model_count"
    t.integer  "max_model_count"
    t.integer  "slots",                    default: 2
    t.integer  "detachment_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "datasheet_id"
    t.integer  "toughness",                default: 4
    t.integer  "fnp",                      default: 7
    t.text     "faction_keywords",         default: [],              array: true
    t.text     "keywords",                 default: [],              array: true
    t.text     "abilities",                default: [],              array: true
    t.index ["datasheet_id"], name: "index_units_on_datasheet_id", using: :btree
    t.index ["detachment_id"], name: "index_units_on_detachment_id", using: :btree
  end

  create_table "units_simulations", id: false, force: :cascade do |t|
    t.integer "simulation_id"
    t.integer "unit_id"
    t.index ["simulation_id"], name: "index_units_simulations_on_simulation_id", using: :btree
    t.index ["unit_id"], name: "index_units_simulations_on_unit_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "valid_detachments", force: :cascade do |t|
    t.text     "name"
    t.integer  "command_points"
    t.integer  "min_troops"
    t.integer  "min_elites"
    t.integer  "min_fast"
    t.integer  "min_heavy"
    t.integer  "min_hq"
    t.integer  "min_lord"
    t.integer  "min_flyer"
    t.boolean  "dedicated_allowed"
    t.integer  "max_troops"
    t.integer  "max_elites"
    t.integer  "max_fast"
    t.integer  "max_heavy"
    t.integer  "max_hq"
    t.integer  "max_lord"
    t.integer  "max_flyer"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "datasheet_name"
    t.string   "name"
    t.integer  "slot"
    t.boolean  "ranged",                     default: true
    t.boolean  "melee",                      default: false
    t.integer  "primaryAddedMeleeStr",       default: 0
    t.integer  "secondaryAddedMeleeStr",     default: 0
    t.integer  "primaryMeleeRend",           default: 0
    t.integer  "secondaryMeleeRend",         default: 0
    t.integer  "firstShootAttacks",          default: 1
    t.boolean  "firstShootAttacksD3",        default: false
    t.boolean  "firstShootAttacksD6",        default: false
    t.integer  "secondShootAttacks",         default: 0
    t.boolean  "secondShootAttacksD3",       default: false
    t.boolean  "secondShootAttacksD6",       default: false
    t.integer  "thirdShootAttacks",          default: 0
    t.integer  "fourthShootAttacks",         default: 0
    t.integer  "firstRange"
    t.integer  "secondRange"
    t.integer  "thirdRange"
    t.integer  "fourthRange"
    t.boolean  "firstShootAttacksDamageD3",  default: false
    t.boolean  "firstShootAttacksDamageD6",  default: false
    t.boolean  "secondShootAttacksDamageD3", default: false
    t.boolean  "secondShootAttacksDamageD6", default: false
    t.integer  "points"
    t.integer  "firstShootDamage",           default: 1
    t.integer  "secondShootDamage",          default: 0
    t.integer  "thirdShootDamage",           default: 0
    t.integer  "fourthShootDamage",          default: 0
    t.integer  "firstShootRend"
    t.integer  "secondShootRend"
    t.integer  "thirdShootRend"
    t.integer  "fourthShootRend"
    t.integer  "firstShootStrength"
    t.integer  "secondShootStrength"
    t.integer  "thirdShootStrength"
    t.integer  "fourthShootStrength"
    t.text     "weapon_type"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "allequipped",                default: true
    t.text     "abilities",                  default: [],                 array: true
    t.text     "abilities_second",           default: [],                 array: true
    t.text     "abilities_third",            default: [],                 array: true
    t.text     "abilities_fourth",           default: [],                 array: true
    t.integer  "datasheet_id"
    t.integer  "unit_id"
    t.index ["datasheet_id"], name: "index_weapons_on_datasheet_id", using: :btree
    t.index ["unit_id"], name: "index_weapons_on_unit_id", using: :btree
  end

  add_foreign_key "attack_groups", "simulations"
  add_foreign_key "detachments", "lists"
  add_foreign_key "lists", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "results", "attack_groups"
  add_foreign_key "results", "simulations"
  add_foreign_key "simulations", "users"
  add_foreign_key "units", "datasheets"
  add_foreign_key "units", "detachments"
  add_foreign_key "weapons", "datasheets"
  add_foreign_key "weapons", "units"
end
