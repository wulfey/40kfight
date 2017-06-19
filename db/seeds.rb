# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'datasheets.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Datasheet.new
    t.name = row['name']
    t.role = row['role']
    t.power = row['power']
    t.movement = row['movement']
    t.shooting_skill = row['shooting_skill']
    t.combat_skill = row['combat_skill']
    t.strength = row['strength']
    t.toughness = row['toughness']
    t.attacks = row['attacks']
    t.wounds = row['wounds']
    t.leadership = row['leadership']
    t.armor_save = row['armor_save']
    t.invul_shooting = row['invul_shooting']
    t.invul_combat = row['invul_combat']
    t.single_model_point_cost = row['single_model_point_cost']
    t.model_count_increment = row['model_count_increment']
    t.power_for_each_increment = row['power_for_each_increment']
    t.min_model_count = row['min_model_count']
    t.max_model_count = row['max_model_count']
    t.first_slot = row['first_slot']
    t.second_slot = row['second_slot']
    t.third_slot = row['third_slot']
    t.fourth_slot = row['fourth_slot']


    t.save
    puts "#{t.name} saved"
  end
puts "There are now #{Datasheet.count} rows in the Datasheet table"


#
# userT = User.create(email: 'tester@gmail.com')
#
# datasheetT = Datasheet.create(name: 'kataphron', role: 'troop', power: 10, movement: 6, shooting_skill: 4, strength: 5, combat_skill: 4, attacks: 1, wounds: 3, leadership: 7, armor_save: 4, invul_combat: 6, invul_shooting: 6, single_model_point_cost: 35, model_count_increment: 3,  power_for_each_increment: 10, min_model_count: 3, max_model_count: 12, first_slot: true, second_slot: true, third_slot: false, fourth_slot: false )
#
# datasheetT2 = Datasheet.create(name: 'onager', role: 'heavy', power: 6, movement: 8, shooting_skill: 3, strength: 5, combat_skill: 5, attacks: 2, wounds: 11, leadership: 7, armor_save: 3, invul_combat: 5, invul_shooting: 5, single_model_point_cost: 90, model_count_increment: 0,  power_for_each_increment: 0, min_model_count: 1, max_model_count: 1, first_slot: true, second_slot: true, third_slot: false, fourth_slot: false)
#
# detachmentT = Detachment.create(name: 'spearhead', command_points: 1, min_troops: 0, min_elites: 0, min_fast: 0, min_heavy: 3, min_hq: 1, min_lord: 0, min_flyer: 0, dedicated_allowed: true, max_troops: 3, max_elites: 2, max_fast: 2, max_heavy: 6, max_hq: 2, max_lord: 0, max_flyer: 2)
#
#
#
# firstWeaponT = FirstWeapon.create(name: "neutron laser", ranged: true, melee: false, primaryAddedMeleeStr: 0, secondaryAddedMeleeStr: 0, primaryMeleeRend: 0, secondaryMeleeRend: 0, firstShootAttacks: 1, firstShootAttacksD3: true, firstShootAttacksD6: false, secondShootAttacks: 0, secondShootAttacksD3: false, secondShootAttacksD6: false, thirdShootAttacks: 0, fourthShootAttacks: 0, firstRange: 48, secondRange: 36, thirdRange: 0, fourthRange: 0, firstShootAttacksDamageD3: false, firstShootAttacksDamageD6: true, secondShootAttacksDamageD3: false, secondShootAttacksDamageD6: false, points: 53,  firstShootDamage: 1, secondShootDamage: 1, thirdShootDamage: 0, fourthShootDamage: 0, firstShootRend: 4, firstShootStrength: 10, abilities: ["neutron"])
#
# firstWeaponT2 = FirstWeapon.create(name: "twin phosphor", firstShootAttacks: 6,  firstRange: 36, secondRange: 36, thirdRange: 0, fourthRange: 0, firstShootAttacksDamageD3: false, firstShootAttacksDamageD6: true, secondShootAttacksDamageD3: false, secondShootAttacksDamageD6: false, points: 53, firstShootDamage: 1, firstShootRend: 2, firstShootStrength: 6, abilities: ["phosphor"])
#
# datasheetT2.first_weapons << firstWeaponT
# datasheetT2.first_weapons << firstWeaponT2
# datasheetT2.save
#
# ref = Datasheet.find_by name: 'kataphron'
#
# unitT = Unit.create(name: ref.name,
# role: ref.role,
# power: ref.power,
# movement: ref.movement,
# shooting_skill: ref.shooting_skill,
# strength: ref.strength,
# combat_skill: ref.combat_skill,
# attacks: ref.attacks,
# wounds: ref.wounds,
# leadership: ref.leadership,
# armor_save: ref.armor_save,
# invul_shooting: ref.invul_shooting,
# invul_combat: ref.invul_combat,
# single_model_point_cost: ref.single_model_point_cost,
# model_count_increment: ref.model_count_increment,
# power_for_each_increment: ref.power_for_each_increment,
# min_model_count: ref.min_model_count,
# max_model_count: ref.max_model_count
# )
#
# ref.units << unitT
# ref.save
#
# validT = ValidDetachment.create(name: "spearhead",
# command_points: 1,
# min_troops: 0,
# min_elites: 0,
# min_fast: 0,
# min_heavy: 3,
# min_hq: 1,
# min_lord: 0,
# min_flyer: 0,
# dedicated_allowed: true,
# max_troops: 2,
# max_elites: 2,
# max_fast: 2,
# max_heavy: 6,
# max_hq: 2,
# max_lord: 0,
# max_flyer: 2
#
# )
#
#
# vd = ValidDetachment.find_by name: 'spearhead'
#
# detachT = Detachment.create(name: vd.name,
#     command_points: vd.command_points,
#     min_troops: vd.min_troops,
#     min_elites: vd.min_elites,
#     min_fast: vd.min_fast,
#     min_heavy: vd.min_heavy,
#     min_hq: vd.min_hq,
#     min_lord: vd.min_lord,
#     min_flyer: vd.min_flyer,
#     dedicated_allowed: vd.dedicated_allowed,
#     max_troops: vd.max_troops,
#     max_elites: vd.max_elites,
#     max_fast: vd.max_fast,
#     max_heavy: vd.max_heavy,
#     max_hq: vd.max_hq,
#     max_lord: vd.max_lord,
#     max_flyer: vd.max_flyer,
#     cur_troops: 0,
#     cur_elites: 0,
#     cur_fast: 0,
#     cur_heavy: 0,
#     cur_hq: 0,
#     cur_lord: 0,
#     cur_flyer: 0)
