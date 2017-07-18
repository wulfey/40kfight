
def d6
  rand(1..6)
end


def fourRerollOnes
  ary = []
  rolls = 900000
  rolls.times do
    ary << d6
  end
  ary.sort!

  # reroll 1s
  while ary[0] == 1
    ary.shift
    ary << d6
  end

  ary.sort!
  while ary[0] < 4
    ary.shift
  end

  succ = ary.count*100.0/rolls
  puts "fourRerollOnes hit #{ary.count} times for #{succ}%"

end

def fourRerollOnesPENALTY

  ary = []
  rolls = 900000
  rolls.times do
    ary << d6
  end
  ary.sort!

  # reroll 1s
  while ary[0] == 1
    ary.shift
    ary << d6
  end

  ary.sort!
  while ary[0] < 5
    ary.shift
  end

  succ = ary.count*100.0/rolls
  puts "fourRerollOnesPENALTY hit #{ary.count} times for #{succ}%"


end


def threeFullRerolls

  ary = []
  rolls = 900000
  rolls.times do
    ary << d6
  end
  ary.sort!

  # reroll
  while ary[0] < 3
    ary.shift
    ary << d6
  end

  ary.sort!
  while ary[0] < 3
    ary.shift
  end

  succ = ary.count*100.0/rolls
  puts "threeFullRerolls hit #{ary.count} times for #{succ}%"


end

def  threeFullRerollsPENALTY

  ary = []
  rolls = 900000
  rolls.times do
    ary << d6
  end
  ary.sort!

  # reroll
  while ary[0] < 3
    ary.shift
    ary << d6
  end

  ary.sort!
  while ary[0] < 4
    ary.shift
  end

  succ = ary.count*100.0/rolls
  puts "threeFullRerollsPENALTY hit #{ary.count} times for #{succ}%"


end


def fourRerollOnesPENALTYFliers

  ary = []
  rolls = 900000
  rolls.times do
    ary << d6
  end
  ary.sort!

  # reroll 1s
  while ary[0] == 1
    ary.shift
    ary << d6
  end

  ary.sort!
  while ary[0] < 6
    ary.shift
  end

  succ = ary.count*100.0/rolls
  puts "fourRerollOnesPENALTYFliers hit #{ary.count} times for #{succ}%"


end


def  threeFullRerollsPENALTYFliers

  ary = []
  rolls = 900000
  rolls.times do
    ary << d6
  end
  ary.sort!

  # reroll
  while ary[0] < 3
    ary.shift
    ary << d6
  end

  ary.sort!
  while ary[0] < 5
    ary.shift
  end

  succ = ary.count*100.0/rolls
  puts "threeFullRerollsPENALTYFliers hit #{ary.count} times for #{succ}%"


end


fourRerollOnes
fourRerollOnesPENALTY
fourRerollOnesPENALTYFliers
puts " ----  "
threeFullRerolls
threeFullRerollsPENALTY
threeFullRerollsPENALTYFliers
