
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


def  rerollCharge(dist)

  ary = []

  rolls = 900000
  rolls.times do
    a = d6
    b = d6
    if (a + b) > dist
      ary << (a + b)
    end
  end


  bary = []
  rolls = 900000
  rolls.times do
    a = d6
    b = d6
    if (a + b) > dist
      bary << (a + b)
    else
      cary = []
      cary << a
      cary << b
      cary.sort!
      cary.shift
      cary << d6
      c = cary[0] + cary[1]
      if c > dist
        bary << c
      end
    end
  end

  dary = []
  rolls.times do
    a = d6
    b = d6
    if (a + b) > dist
      dary << (a + b)
    else
      a = d6
      b = d6
      if (a + b) > dist
        dary << (a + b)
      end
    end
  end

  puts "   "
  succ = ary.count*100.0/rolls
  puts "base charge odds = #{ary.count} times for #{succ}% for needing #{dist+1}"

  succ = dary.count*100.0/rolls
  puts "full reroll charge odds = #{dary.count} times for #{succ}% for needing #{dist+1}"

  succ = bary.count*100.0/rolls
  puts "command reroll charge odds = #{bary.count} times for #{succ}% for needing #{dist+1}"
  puts "   "

end

def arySum (ary)
    sum = 0
    ary.each do |d|
        sum += d
    end
    sum
end

def aggressor(models, rerollHit, rerollWound, toWound, save, name)
  n = models*2

  tot = 0
  tot += n*6

  ary = []

  rolls = 3000
  rolls.times do
    bary = []
    n.times do
      bary << d6
    end
    ary << arySum(bary)
  end

  megatot = arySum(ary)
  megatot = megatot*1.0/rolls

  tot += megatot
  # puts megatot
  # puts "aggressors fire on average #{tot}"

  a = tot.floor

  rolls = 10000
  ary = []

  # to hit
  rolls.times do
    a.times do
      ary << d6
    end
  end
  ary.sort!

  # reroll hit
  if (rerollHit)
    while ary[0] < 3
      ary.shift
      ary << d6
    end
    ary.sort!
  end

  # drop the misses
  while ary[0] < 3
    ary.shift
  end

  hits = ary.count
  puts "#{hits*1.0/rolls} average hits"
  wary = []
  hits.times do
    wary << d6
  end

  # reroll 1s to wound
  if (rerollWound)
    wary.sort!
    while wary[0] == 1
      wary.shift
      wary << d6
    end
  end

  wary.sort!
  while wary[0] < toWound
    wary.shift
  end

  wounds = wary.count
  puts "#{wounds*1.0/rolls} average wounds"
  sary = []
  wounds.times do
    sary << d6
  end
  sary.sort!
  sary.reverse!
  while sary[0] >= save
    sary.shift
  end
  inflicted = sary.count


  puts "#{inflicted*1.0/rolls} average killed #{name} a volley"




end

# model
# aggressor(models, rerollHit, rerollWound, toWound, save, name)


aggressor(6, true, true, 4, 6, "ork")
aggressor(6, false, false, 4, 6, "ork")

aggressor(6, true, true, 5, 3, "rhino hullpoints")
aggressor(6, false, false, 5, 3, "rhino hullpoints")

aggressor(6, true, true, 4, 3, "MEQ")
aggressor(6, false, false,  4, 3, "MEQ")

aggressor(6, true, true, 6, 3, "knight hullpoints")
aggressor(6, false, false, 6, 3, "knight hullpoints")

aggressor(6, true, true, 3, 5, "guard")
aggressor(6, false, false, 3, 5, "guard")


aggressor(6, true, true, 4, 4, "genesstealr")
aggressor(6, false, false, 4, 4, "genesstealr")

aggressor(6, true, true, 5, 3, "biker wounds")
aggressor(6, false, false, 5, 3, "biker wounds")

aggressor(6, true, true, 3, 4, "skitarii")
aggressor(6, false, false, 3, 4, "skitarii")


aggressor(6, true, true, 3, 4, "skitarii")
aggressor(6, false, false, 3, 4, "skitarii")




#
# rerollCharge(2)
# rerollCharge(3)
# rerollCharge(4)
# rerollCharge(5)
