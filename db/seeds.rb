# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


userT = User.create(email: 'tester@gmail.com')

datasheetT = Datasheet.create(name: 'kataphron destroyers', role: 'troop', power: 10, movement: 6, shooting_skill: 4, strength: 5, combat_skill: 4, attacks: 1, wounds: 3, leadership: 7, armor_save: 4, invul_combat: 6, invul_shooting: 6, single_model_point_cost: 35, model_count_increment:  )

# ***********************************

  create_table "datasheets", force: :cascade do |t|
    t.text     "name"
    t.text     "role"
    t.integer  "power"
    t.integer  "movemovent"
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
    t.boolean  "first_slot"
    t.boolean  "second_slot"
    t.boolean  "third_slot"
    t.boolean  "fourth_slot"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
    t.integer  "list_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["list_id"], name: "index_detachments_on_list_id", using: :btree
  end

  create_table "first_weapon_slots", force: :cascade do |t|
    t.integer  "datasheet_id"
    t.integer  "first_weapon_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["datasheet_id"], name: "index_first_weapon_slots_on_datasheet_id", using: :btree
    t.index ["first_weapon_id"], name: "index_first_weapon_slots_on_first_weapon_id", using: :btree
  end

  create_table "first_weapons", force: :cascade do |t|
    t.boolean  "ranged"
    t.boolean  "melee"
    t.integer  "primaryAddedMeleeStr"
    t.integer  "secondaryAddedMeleeStr"
    t.integer  "primaryMeleeRend"
    t.integer  "secondaryMeleeRend"
    t.integer  "firstShootAttacks"
    t.boolean  "firstShootAttacksD3"
    t.boolean  "firstShootAttacksD6"
    t.integer  "secondShootAttacks"
    t.boolean  "secondShootAttacksD3"
    t.boolean  "secondShootAttacksD6"
    t.integer  "thirdShootAttacks"
    t.integer  "fourthShootAttacks"
    t.integer  "firstRange"
    t.integer  "secondRange"
    t.integer  "thirdRange"
    t.integer  "fourthRange"
    t.boolean  "firstShootAttacksDamageD3"
    t.boolean  "firstShootAttacksDamageD6"
    t.boolean  "secondShootAttacksDamageD3"
    t.boolean  "secondShootAttacksDamageD6"
    t.integer  "points"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
  end

  create_table "fourth_weapon_slots", force: :cascade do |t|
    t.integer  "datasheet_id"
    t.integer  "fourth_weapon_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["datasheet_id"], name: "index_fourth_weapon_slots_on_datasheet_id", using: :btree
    t.index ["fourth_weapon_id"], name: "index_fourth_weapon_slots_on_fourth_weapon_id", using: :btree
  end

  create_table "fourth_weapons", force: :cascade do |t|
    t.boolean  "ranged"
    t.boolean  "melee"
    t.integer  "primaryAddedMeleeStr"
    t.integer  "secondaryAddedMeleeStr"
    t.integer  "primaryMeleeRend"
    t.integer  "secondaryMeleeRend"
    t.integer  "firstShootAttacks"
    t.boolean  "firstShootAttacksD3"
    t.boolean  "firstShootAttacksD6"
    t.integer  "secondShootAttacks"
    t.boolean  "secondShootAttacksD3"
    t.boolean  "secondShootAttacksD6"
    t.integer  "thirdShootAttacks"
    t.integer  "fourthShootAttacks"
    t.integer  "firstRange"
    t.integer  "secondRange"
    t.integer  "thirdRange"
    t.integer  "fourthRange"
    t.boolean  "firstShootAttacksDamageD3"
    t.boolean  "firstShootAttacksDamageD6"
    t.boolean  "secondShootAttacksDamageD3"
    t.boolean  "secondShootAttacksDamageD6"
    t.integer  "points"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
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

  create_table "second_weapon_slots", force: :cascade do |t|
    t.integer  "datasheet_id"
    t.integer  "second_weapon_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["datasheet_id"], name: "index_second_weapon_slots_on_datasheet_id", using: :btree
    t.index ["second_weapon_id"], name: "index_second_weapon_slots_on_second_weapon_id", using: :btree
  end

  create_table "second_weapons", force: :cascade do |t|
    t.boolean  "ranged"
    t.boolean  "melee"
    t.integer  "primaryAddedMeleeStr"
    t.integer  "secondaryAddedMeleeStr"
    t.integer  "primaryMeleeRend"
    t.integer  "secondaryMeleeRend"
    t.integer  "firstShootAttacks"
    t.boolean  "firstShootAttacksD3"
    t.boolean  "firstShootAttacksD6"
    t.integer  "secondShootAttacks"
    t.boolean  "secondShootAttacksD3"
    t.boolean  "secondShootAttacksD6"
    t.integer  "thirdShootAttacks"
    t.integer  "fourthShootAttacks"
    t.integer  "firstRange"
    t.integer  "secondRange"
    t.integer  "thirdRange"
    t.integer  "fourthRange"
    t.boolean  "firstShootAttacksDamageD3"
    t.boolean  "firstShootAttacksDamageD6"
    t.boolean  "secondShootAttacksDamageD3"
    t.boolean  "secondShootAttacksDamageD6"
    t.integer  "points"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
  end

  create_table "third_weapon_slots", force: :cascade do |t|
    t.integer  "datasheet_id"
    t.integer  "third_weapon_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["datasheet_id"], name: "index_third_weapon_slots_on_datasheet_id", using: :btree
    t.index ["third_weapon_id"], name: "index_third_weapon_slots_on_third_weapon_id", using: :btree
  end

  create_table "third_weapons", force: :cascade do |t|
    t.boolean  "ranged"
    t.boolean  "melee"
    t.integer  "primaryAddedMeleeStr"
    t.integer  "secondaryAddedMeleeStr"
    t.integer  "primaryMeleeRend"
    t.integer  "secondaryMeleeRend"
    t.integer  "firstShootAttacks"
    t.boolean  "firstShootAttacksD3"
    t.boolean  "firstShootAttacksD6"
    t.integer  "secondShootAttacks"
    t.boolean  "secondShootAttacksD3"
    t.boolean  "secondShootAttacksD6"
    t.integer  "thirdShootAttacks"
    t.integer  "fourthShootAttacks"
    t.integer  "firstRange"
    t.integer  "secondRange"
    t.integer  "thirdRange"
    t.integer  "fourthRange"
    t.boolean  "firstShootAttacksDamageD3"
    t.boolean  "firstShootAttacksDamageD6"
    t.boolean  "secondShootAttacksDamageD3"
    t.boolean  "secondShootAttacksDamageD6"
    t.integer  "points"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
  end

  create_table "units", force: :cascade do |t|
    t.text     "name"
    t.text     "role"
    t.integer  "power"
    t.integer  "movemovent"
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
    t.integer  "detachment_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["detachment_id"], name: "index_units_on_detachment_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
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

  add_foreign_key "detachments", "lists"
  add_foreign_key "first_weapon_slots", "datasheets"
  add_foreign_key "first_weapon_slots", "first_weapons"
  add_foreign_key "fourth_weapon_slots", "datasheets"
  add_foreign_key "fourth_weapon_slots", "fourth_weapons"
  add_foreign_key "lists", "users"
  add_foreign_key "second_weapon_slots", "datasheets"
  add_foreign_key "second_weapon_slots", "second_weapons"
  add_foreign_key "third_weapon_slots", "datasheets"
  add_foreign_key "third_weapon_slots", "third_weapons"
  add_foreign_key "units", "detachments"
end
