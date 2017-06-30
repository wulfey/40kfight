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
    t.wounds = row['wounds']
    t.attacks = row['attacks']
    t.leadership = row['leadership']
    t.armor_save = row['armor_save']
    t.invul_shooting = row['invul_shooting']
    t.invul_combat = row['invul_combat']
    t.single_model_point_cost = row['single_model_point_cost']
    t.model_count_increment = row['model_count_increment']
    t.power_for_each_increment = row['power_for_each_increment']
    t.min_model_count = row['min_model_count']
    t.max_model_count = row['max_model_count']
    t.fnp = row['fnp']
    t.leaderAttacks = row['leaderAttacks']
    t.slots = row['slots']
    t.abilities << row['abilities']

    t.save
    puts "#{t.name} saved"
  end
puts "There are now #{Datasheet.count} rows in the Datasheet table"


csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'weapons.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')
csv2.each do |row|
    t = Weapon.new

    t.datasheet_name = row['datasheet_name']
    t.name = row['name']
    t.slot = row['slot']
    t.ranged = row['ranged']
    t.melee = row['melee']
    t.primaryAddedMeleeStr = row['primaryAddedMeleeStr']
    t.secondaryAddedMeleeStr = row['secondaryAddedMeleeStr']
    t.primaryMeleeRend = row['primaryMeleeRend']
    t.secondaryMeleeRend = row['secondaryMeleeRend']
    t.firstShootAttacks = row['firstShootAttacks']
    t.firstShootAttacksD3 = row['firstShootAttacksD3']
    t.firstShootAttacksD6 = row['firstShootAttacksD6']
    t.secondShootAttacks = row['secondShootAttacks']
    t.secondShootAttacksD3 = row['secondShootAttacksD3']
    t.secondShootAttacksD6 = row['secondShootAttacksD6']
    t.thirdShootAttacks = row['thirdShootAttacks']
    t.fourthShootAttacks = row['fourthShootAttacks']
    t.firstRange = row['firstRange']
    t.secondRange = row['secondRange']
    t.thirdRange = row['thirdRange']
    t.fourthRange = row['fourthRange']
    t.firstShootAttacksDamageD3 = row['firstShootAttacksDamageD3']
    t.firstShootAttacksDamageD6 = row['firstShootAttacksDamageD6']
    t.secondShootAttacksDamageD3 = row['secondShootAttacksDamageD3']
    t.secondShootAttacksDamageD6 = row['secondShootAttacksDamageD6']
    t.points = row['points']
    t.firstShootDamage = row['firstShootDamage']
    t.secondShootDamage = row['secondShootDamage']
    t.thirdShootDamage = row['thirdShootDamage']
    t.fourthShootDamage = row['fourthShootDamage']
    t.firstShootRend = row['firstShootRend']
    t.secondShootRend = row['secondShootRend']
    t.thirdShootRend = row['thirdShootRend']
    t.fourthShootRend = row['fourthShootRend']
    t.firstShootStrength = row['firstShootStrength']
    t.secondShootStrength = row['secondShootStrength']
    t.thirdShootStrength = row['thirdShootStrength']
    t.fourthShootStrength = row['fourthShootStrength']
    t.abilities << row['abilities']
    t.abilities_second << row['abilities_second']
    t.abilities_third << row['abilities_third']
    t.abilities_fourth << row['abilities_fourth']






    t.weapon_type = row['weapon_type']
    t.allequipped = row['allequipped']


    t.save
    puts "#{t.name} saved"
  end
puts "There are now #{Weapon.count} rows in the weapon table"

# clean up the abilities of the weapons
total = Weapon.count
i = 1
while i <= total do
    wep = Weapon.find(i)

    if wep.abilities == [nil]
        wep.abilities = []
    end
    if wep.abilities_second == [nil]
        wep.abilities_second = []
    end
    if wep.abilities_third == [nil]
        wep.abilities_third = []
    end
    if wep.abilities_fourth == [nil]
        wep.abilities_fourth = []
    end

    if wep.abilities.count > 0
        wep.abilities = wep.abilities[0].partition("/")
        wep.abilities.delete("/")
        wep.abilities.delete("")
    end
    if wep.abilities_second.count > 0
        wep.abilities_second = wep.abilities_second[0].partition("/")
        wep.abilities_second.delete("/")
        wep.abilities.delete("")
    end
    if wep.abilities_third.count > 0
        wep.abilities_third = wep.abilities_third[0].partition("/")
        wep.abilities_third.delete("/")
        wep.abilities.delete("")
    end
    if wep.abilities_fourth.count > 0
        wep.abilities_fourth = wep.abilities_fourth[0].partition("/")
        wep.abilities_fourth.delete("/")
        wep.abilities.delete("")
    end
    wep.save
    i+=1
end


total = Datasheet.count
i = 1
while i <= total do
    wep = Datasheet.find(i)

    if wep.abilities == [nil]
        wep.abilities = []
    end
    if wep.abilities.count > 0
        wep.abilities = wep.abilities[0].partition("/")
        wep.abilities.delete("/")
        wep.abilities.delete("")
    end

    wep.save
    i+=1
end



# create some base units for shooting side
total = Datasheet.count
i = 1
while i <= total do
    d = Datasheet.find(i)
    u = Unit.new
    u.name = d.name
    u.role = d.role
    u.power = d.power
    u.movement = d.movement
    u.shooting_skill = d.shooting_skill
    u.strength = d.strength
    u.combat_skill = d.combat_skill
    u.attacks = d.attacks
    u.wounds = d.wounds
    u.leadership = d.leadership
    u.armor_save = d.armor_save
    u.invul_shooting = d.invul_shooting
    u.invul_combat = d.invul_combat
    u.single_model_point_cost = d.single_model_point_cost
    u.model_count_increment = d.model_count_increment
    u.power_for_each_increment = d.power_for_each_increment
    u.min_model_count = d.min_model_count
    u.max_model_count = d.max_model_count
    u.slots = d.slots
    u.toughness = d.toughness
    u.fnp = d.fnp
    u.faction_keywords = d.faction_keywords
    u.keywords = d.keywords
    u.abilities = d.abilities
    u.save
    puts "There are now #{Unit.count} rows in the Unit table, at Datasheet numer #{i}, #{d.name}"
    i+=1
end

# add weapons to datasheets and weapons
total = Weapon.count
i = 1
while i <= total do
    wep = Weapon.find(i)
    d = Datasheet.find_by(name: wep.datasheet_name)
    u = Unit.find_by(name: wep.datasheet_name)
    d.weapons << wep
    u.weapons << wep
    u.save
    d.save
    puts "#{wep.name} added to datasheet: #{d.name} and unit: #{u.name} with #{d.weapons.count} total weapons"
    i+=1
end
