def firstDuplicate(a)

firsts = {}
dups = {}

a.each_index do |i|
  # if it isn't in the firsts hash, add it
  if !firsts[a[i]]
    firsts[a[i]] = i
  # if it is in the firsts and not in the dups, add it ot the dups with the distance
  elsif !dups[a[i]]
    dups[a[i]] = i - firsts[a[i]]
    return a[i]
  end
end

# puts " ---- firsts: "
# print firsts
# puts ""
# puts " ---- dups: "
#
# print dups
# puts " ---- "

if dups == {}
  return -1
end

lowestVal = a.length
winningKey = a.length
dups.each do |key, value|
  if value < lowestVal
    lowestVal = value
    winningKey = key
  end
end

return winningKey

end


puts firstDuplicate([2, 3, 3, 1, 5, 2]) == 3

puts firstDuplicate([2, 4, 3, 5, 1]) == -1

puts firstDuplicate([1]) == -1

puts firstDuplicate([2, 2]) == 2

puts firstDuplicate([2, 1]) == -1

 puts firstDuplicate([2, 1, 3]) == -1


puts firstDuplicate([2, 3, 3]) == 3

puts firstDuplicate([3, 3, 3]) == 3


puts firstDuplicate([8, 4, 6, 2, 6, 4, 7, 9, 5, 8]) == 6
