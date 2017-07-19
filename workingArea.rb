for i in 1..5
  puts i
end

h = {}
h["alpha"] = [0,0,0,0,0]
h["beta"] = [0,0,0,0,0]
h["ceta"] = [0,0,0,0,0]
h["duteron"] = [0,0,0,0,0]
h["epsilon"] = [0,0,0,0,0]

h.each do |hash|
  puts "hash is: #{hash}"
  puts hash[0]
  print hash[1]
end



          <%= link_to "<span class=\"glyphicon glyphicon-screenshot\"></span>".html_safe, any_attack_path(sim.id,1), method: :post, class: "btn btn-success btn-default" %>


# print h["alpha"][0] + 1
# print h["alpha"][0] + 5


<label><input id="attacker_id" type="radio" value= "<%=unit.id%>"   name="attacker"></label>


#
# <div class="container">
#   <div class="table-responsive">
#     <table class="table table-striped table-bordered table-hover">
#       <thead>
#         <tr>
#           <th>Simulations</th>
#           <th></th>
#           <th></th>
#           <th></th>
#         </tr>
#       </thead>
#
#       <tbody>
#         <%= content_tag_for(:tr, @simulations) do |simulation| %>
#               <td><%= simulation.battle %></td>
#               <td><%= link_to 'Show', simulation %></td>
#           <td><%= link_to 'Edit', edit_simulation_path(simulation) %></td>
#           <td><%= link_to 'Destroy', simulation, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#         <% end %>
#       </tbody>
#     </table>
#   </div>
# </div>
#
#

puts h["alpha"][0]
h["alpha"][0] += 9
puts h["alpha"][0]

#
# s = Simulation.last
# ag = s.attack_groups.last
# r = Result.last
# ag.results << r
#
#
#
# u.name = d.name
# u.role = d.role
# u.power = d.power
# u.movement = d.movement
# u.shooting_skill = d.shooting_skill
# u.strength = d.strength
# u.combat_skill = d.combat_skill
# u.attacks = d.attacks
# u.wounds = d.wounds
# u.leadership = d.leadership
# u.armor_save = d.armor_save
# u.invul_shooting = d.invul_shooting
# u.invul_combat = d.invul_combat
# u.single_model_point_cost = d.single_model_point_cost
# u.model_count_increment = d.model_count_increment
# u.power_for_each_increment = d.power_for_each_increment
# u.min_model_count = d.min_model_count
# u.max_model_count = d.max_model_count
# u.slots = d.slots
# u.toughness = d.toughness
# u.fnp = d.fnp
# u.faction_keywords = d.faction_keywords
# u.keywords = d.keywords
#
#
# a = Unit.find(2)
# t = Datasheet.find(8)
# s = Simulation.new
# s.any_attack(a,t)
#
#
#
# a = Unit.find(2)
# t = Datasheet.find(11)
# s = Simulation.new
# s.any_attack(a,t)
#
#
#
# a = Unit.find(16)
# t = Datasheet.find(19)
# s = Simulation.new
# s.any_attack(a,t)
