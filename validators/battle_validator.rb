# class BattleValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.lists.count < 3
#       record.errors[:name] << 'Maximum 2 lists'
#     end
#   end
# end
# 
# <!-- <li><%= link_to "Add Simulator to Battle", simulations_path, method: :post %></li> -->
# <!-- <li class="active"><a href="#">Simulator</a></li>
# <li><a href="#simulator">About</a></li> -->
# <!-- <li><%= link_to "Your First Simulator", simulation_path(current_user.simulations.first) %></li> -->

u = User.last
b = u.battles.first
l1 = b.lists.first
l2 = b.lists.last
un = Unit.last
d1 = l1.detachments.first
s = Simulation.last


b.simulations << s
