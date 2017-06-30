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


a = Unit.find(2)
t = Datasheet.find(8)
s = Simulation.new
s.any_attack(a,t)



a = Unit.find(2)
t = Datasheet.find(11)
s = Simulation.new
s.any_attack(a,t)



a = Unit.find(16)
t = Datasheet.find(19)
s = Simulation.new
s.any_attack(a,t)
