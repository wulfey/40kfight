
puts "ONAGER"
puts "Icarus"


def max6 (number)
  if number > 6
    number = 6
  end
  return number
end

def toughChart (strength, toughness)

  if strength >= toughness*2.0
    return (5/6.0)
  elsif strength > toughness
    return (4/6.0)
  elsif strength == toughness
    return (3/6.0)
  elsif strength <= toughness/2.0
    return (1/6.0)
  else
    return (2/6.0)
  end

end

def roll(x)
  if rand(1..6)

end

def fireIcarus (toughness, save, flying)
  if flying
    wound1 = 1 * (5/6.0) * toughChart(7,toughness) * (max6(save-1+3)/6.0) * 3.5
    wound2 = 5 * (5/6.0) * toughChart(6,toughness) * (max6(save-1+2)/6.0) * 1
    wound3 = 4 * (5/6.0) * toughChart(7,toughness) * (max6(save-1+1)/6.0) * 2
    return wound1+wound2+wound3
  else
    wound1 = 1 * (3/6.0) * toughChart(7,toughness) * (max6(save-1+3)/6.0) * 3.5
    wound2 = 5 * (3/6.0) * toughChart(6,toughness) * (max6(save-1+2)/6.0) * 1
    wound3 = 4 * (3/6.0) * toughChart(7,toughness) * (max6(save-1+1)/6.0) * 2
    return wound1+wound2+wound3
  end
end

sum = 0
100.times do
  sum += fireIcarus(4,3,false)
end

puts "average damage versus marines #{sum/100}"

sum = 0
100.times do
  sum += fireIcarus(7,3,true)
end

puts "average damage versus bloodthirster #{sum/100}"


sum = 0
100.times do
  sum += fireIcarus(8,3,false)
end

puts "average damage versus knight #{sum/100}"
