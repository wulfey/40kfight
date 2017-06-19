

def roll(n)
    ary = []
    n.times do
        ary << rand(1..6)
    end
    ary.sort!
    ary
end

def arySum (ary)
    sum = 0
    ary.each do |d|
        sum += d
    end
    sum
end

# charges = []
#
# executions = 10000
#
# savedByReroll = 0
# didNotSaveByReroll = 0
# fails = 0
#
# executions.times do
#     a = roll(3)
#     dist = arySum(a)
#     charges << dist
#
#
#     if dist < 9
#         fails += 1
#         a.shift
#         a << rand(1..6)
#         if arySum(a) < 9
#             didNotSaveByReroll += 1
#         else
#             savedByReroll += 1
#         end
#     end
#
#
# end
#
#
#
# sum = 0
#
# charges.each do |add|
#     sum += add
# end
#
# avg = 1.0*sum/executions
#
# puts "in #{executions} charges, the average was #{avg} with #{100.0*(executions - fails)/executions} success rate"
#
#
# puts "in #{fails} failed charges, #{savedByReroll} charges were saved at #{100.0*savedByReroll/fails}"
#
# puts "using CP results in #{100.0*(executions - fails + savedByReroll)/executions} odds of success"


def touWoundCalc (str,tuf,sv)

    toWound = 6

    if str == tuf
        return 4
    end

    if str > tuf && str < tuf*2.0
        return 3
    end

    if str < tuf && str > tuf/2.0
        return 5
    end

    if str >= tuf*2
        return 2
    end

    if str <= tuf/2.0
        return 6
    end

    toWound
end

$deadFromPlasma = []

def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal6, shooting, overcharge)

    # puts "pre rended save #{sv}"
    sv += rend

    # puts "rended save #{sv}"

    damage = 0
    attacks = roll(atks)

    # print attacks
    # puts "base hits #{attacks.length}"

    # puts "attacks: "
    # print attacks
    # puts " "



    j = 0
    leng = attacks.length
    if shooting
        while attacks[0] < toHit
            # puts "#{attacks[0]} rerolling this "
            attacks.shift
            j += 1
            attacks << rand(1..6)
            if j > leng
                break
            end
        end
    end




    if tesla

        num6s = attacks.count(6)
        num6s.times do
            attacks << 6
        end
        attacks.sort!
    end


    if overcharge
        $deadFromPlasma << attacks.count(1)
    end


    while attacks[0] < toHit
        attacks.shift
        if attacks.length < 1
            return 0
        end
    end
    #
    # print attacks
    # puts "successful attacks over #{toHit} == #{attacks.length}"

    wounds = roll(attacks.length)

    toWound = touWoundCalc(str,tuf,sv)

    # puts "toWound roll needed  :#{toWound}"
    # puts "initial wounds: "
    # print wounds
    # puts " "
    #
    # puts "to Wound: #{toWound}"
    if reroll
        i = 0
        len = wounds.length
        while wounds[0] < toWound
            wounds.shift
            wounds << rand(1..6)
            i += 1
            if i > len
                break
            end
        end
        wounds.sort!
    end

    #
    #
    # puts "wounds after Reroll: "
    # print wounds
    # puts " "

    while wounds[0] < toWound
        wounds.shift
        if wounds.length < 1
            return 0
        end
    end
    #
    # puts "wounds greater than= #{toWound} ==  #{wounds}"



    if mortal6
        mortals = wounds.count(6)
        damage += mortals
        wounds.delete(6)
        if wounds.length < 1
            return damage
        end
    end

    saves = roll(wounds.length)
    #
    # puts "saves: "
    # print saves
    # puts " "
    # #

    # print "base saves roll #{saves}"



    while saves[0] < sv
        saves.shift
        damage += 1
        if saves.length < 1
            return damage
        end
    end


    # puts " >>> #{damage}"




    damage

end

t8sv3 = []
t7sv3 = []
t4sv3 = []
t3sv4 = []
t3sv5 = []
t4sv2 = []

atkExec = 100000




# def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)


t8sv3 = []
t7sv3 = []
t4sv3 = []
t3sv4 = []
t3sv5 = []
t4sv2 = []
puts " ********   PLASMA tempest with Overcharge   ********** "

atkExec.times do
    t8sv3 << melee(8, 3, 8,8,3,3, false, false, false, true, false )
    t7sv3 << melee(8, 3, 8,7,3,3, false, false, false, true, false )
    t4sv3 << melee(8, 3, 8,4,3,3, false, false, false, true, false )
    t3sv4 << melee(8, 3, 8,3,4,3, false, false, false, true, false )
    t3sv5 << melee(8, 3, 8,3,5,3, false, false, false, true, false )
    t4sv2 << melee(8, 3, 8,4,2,3, false, false, false, true, false )
end




puts "versus t8sv3, an average of #{2.0*arySum(t8sv3)/atkExec} was done"
puts "versus t7sv3, an average of #{2.0*arySum(t7sv3)/atkExec} was done"
puts "versus t4sv3, an average of #{2.0*arySum(t4sv3)/atkExec} was done"
puts "versus t3sv4, an average of #{2.0*arySum(t3sv4)/atkExec} was done"
puts "versus t3sv5, an average of #{2.0*arySum(t3sv5)/atkExec} was done"
puts "versus t4sv2, an average of #{2.0*arySum(t4sv2)/atkExec} was done"



def overDeath
    attacks = roll(2)
    ones = attacks.count(1)
    attacks.delete(1)

    ones.times do
        attacks << rand(1..6)
    end
    return attacks.count(1)
end

howMany = []
atkExec.times do
    attacks = roll(2)
    ones = attacks.count(1)
    attacks.delete(1)

    ones.times do
        attacks << rand(1..6)
    end

    howMany << attacks.count(1)

end

# print howMany
puts arySum(howMany)

puts "odds of a plasmaFron dying with reroll 1s: #{1.0*arySum(howMany)/atkExec*100}%"






t8sv3 = []
t7sv3 = []
t4sv3 = []
t3sv4 = []
t3sv5 = []
t4sv2 = []
puts " ********   PLASMA tempest on weak    ********** "

atkExec.times do
    t8sv3 << melee(8, 3, 7,8,3,3, false, false, false, false, false )
    t7sv3 << melee(8, 3, 7,7,3,3, false, false, false, false, false )
    t4sv3 << melee(8, 3, 7,4,3,3, false, false, false, false, false )
    t3sv4 << melee(8, 3, 7,3,4,3, false, false, false, false, false )
    t3sv5 << melee(8, 3, 7,3,5,3, false, false, false, false, false )
    t4sv2 << melee(8, 3, 7,4,2,3, false, false, false, false, false )
end




# def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)

puts "versus t8sv3, an average of #{1.0*arySum(t8sv3)/atkExec} was done"
puts "versus t7sv3, an average of #{1.0*arySum(t7sv3)/atkExec} was done"
puts "versus t4sv3, an average of #{1.0*arySum(t4sv3)/atkExec} was done"
puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
puts "versus t4sv2, an average of #{1.0*arySum(t4sv2)/atkExec} was done"




t8sv3 = []
t7sv3 = []
t4sv3 = []
t3sv4 = []
t3sv5 = []
t4sv2 = []
puts " ********   MELTA tempest   ********** "

atkExec.times do
    t8sv3 << melee(4, 3, 5,8,3,4, false, false, false, false, false )
    t7sv3 << melee(4, 3, 5,7,3,4, false, false, false, false, false )
    t4sv3 << melee(4, 3, 5,4,3,4, false, false, false, false, false )
    t3sv4 << melee(4, 3, 5,3,4,4, false, false, false, false, false )
    t3sv5 << melee(4, 3, 5,3,5,4, false, false, false, false, false )
    t4sv2 << melee(4, 3, 5,4,2,4, false, false, false, false, false )
end






# def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)

puts "versus t8sv3, an average of #{3.5*arySum(t8sv3)/atkExec} was done"
puts "versus t7sv3, an average of #{3.5*arySum(t7sv3)/atkExec} was done"
puts "versus t4sv3, an average of #{3.5*arySum(t4sv3)/atkExec} was done"
puts "versus t3sv4, an average of #{3.5*arySum(t3sv4)/atkExec} was done"
puts "versus t3sv5, an average of #{3.5*arySum(t3sv5)/atkExec} was done"
puts "versus t4sv2, an average of #{3.5*arySum(t4sv2)/atkExec} was done"




# def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)

t8sv3 = []
t7sv3 = []
t4sv3 = []
t3sv4 = []
t3sv5 = []
t4sv2 = []
puts " ********   HOTSHOT volley gun    ********** "

atkExec.times do
    t8sv3 << melee(16, 4, 4,8,3,2, false, false, false, false, false)

    t7sv3 << melee(16, 4, 4,7,3,2, false, false, false, false, false )

    t4sv3 << melee(16, 4, 4,4,3,2, false, false, false, false, false )

    t3sv4 << melee(16, 4, 4,3,4,2, false, false, false, false, false )

    t3sv5 << melee(16, 4, 4,3,5,2, false, false, false, false, false )

    t4sv2 << melee(16, 4, 4,4,2,2, false, false, false, false, false )

end



puts "versus t8sv3, an average of #{3.5*arySum(t8sv3)/atkExec} was done"
puts "versus t7sv3, an average of #{3.5*arySum(t7sv3)/atkExec} was done"
puts "versus t4sv3, an average of #{3.5*arySum(t4sv3)/atkExec} was done"
puts "versus t3sv4, an average of #{3.5*arySum(t3sv4)/atkExec} was done"
puts "versus t3sv5, an average of #{3.5*arySum(t3sv5)/atkExec} was done"
puts "versus t4sv2, an average of #{3.5*arySum(t4sv2)/atkExec} was done"













#
# atkExec.times do
#     t8sv3 << melee(8, 2, 5,8,3,1, true, false, false, false, false )
#     t7sv3 << melee(8, 2, 5,7,3,1, true, false, false, false, false )
#     t4sv3 << melee(8, 2, 5,4,3,1, true, false, false, false, false )
#     t3sv4 << melee(8, 2, 5,3,4,1, true, false, false, false, false )
#     t3sv5 << melee(8, 2, 5,3,5,1, true, false, false, false, false )
#     t4sv2 << melee(8, 2, 5,4,2,1, true, false, false, false, false )
# end
#
# puts " *******   EVERSOR  *********** "
#
# puts "versus t8sv3, an average of #{1.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{1.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{1.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{1.0*arySum(t4sv2)/atkExec} was done"
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   ELECTRO PRIESTS   ********** "
#
# atkExec.times do
#     t8sv3 << melee(15, 3, 5,8,3,0, false, true, false, true, false )
#     t7sv3 << melee(15, 3, 5,7,3,0, false, true, false, true, false )
#     t4sv3 << melee(15, 3, 5,4,3,0, false, true, false, true, false )
#     t3sv4 << melee(15, 3, 5,3,4,0, false, true, false, true, false )
#     t3sv5 << melee(15, 3, 5,3,5,0, false, true, false, true, false )
#     t4sv2 << melee(15, 3, 5,4,2,0, false, true, false, true, false )
# end
#
#
#
# puts "versus t8sv3, an average of #{1.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{1.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{1.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{1.0*arySum(t4sv2)/atkExec} was done"
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   DRAGOON   ********** "
#
# atkExec.times do
#     t8sv3 << melee(3, 3, 8,8,3,0, false, true, false, false, false )
#     t7sv3 << melee(3, 3, 8,7,3,0, false, true, false, false, false )
#     t4sv3 << melee(3, 3, 8,4,3,0, false, true, false, false, false )
#     t3sv4 << melee(3, 3, 8,3,4,0, false, true, false, false, false )
#     t3sv5 << melee(3, 3, 8,3,5,0, false, true, false, false, false )
#     t4sv2 << melee(3, 3, 8,4,2,0, false, true, false, false, false )
# end
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla)
#
# puts "versus t8sv3, an average of #{2.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{2.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{2.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{2.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{2.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{2.0*arySum(t4sv2)/atkExec} was done"
#
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   RUSTALKERS with Blades   ********** "
#
# atkExec.times do
#     t8sv3 << melee(19, 3, 5,8,3,0, false, false, true, false, false )
#     t7sv3 << melee(19, 3, 5,7,3,0, false, false, true, false, false )
#     t4sv3 << melee(19, 3, 5,4,3,0, false, false, true, false, false )
#     t3sv4 << melee(19, 3, 5,3,4,0, false, false, true, false, false )
#     t3sv5 << melee(19, 3, 5,3,5,0, false, false, true, false, false )
#     t4sv2 << melee(19, 3, 5,4,2,0, false, false, true, false, false )
# end
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla)
#
# puts "versus t8sv3, an average of #{1.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{1.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{1.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{1.0*arySum(t4sv2)/atkExec} was done"
#
#
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   STAFFPRIESTS with staffs   ********** "
#
# atkExec.times do
#     t8sv3 << melee(10, 3, 5,8,3,2, false, false, true, false, false )
#     t7sv3 << melee(10, 3, 5,7,3,2, false, false, true, false, false )
#     t4sv3 << melee(10, 3, 5,4,3,2, false, false, true, false, false )
#     t3sv4 << melee(10, 3, 5,3,4,2, false, false, true, false, false )
#     t3sv5 << melee(10, 3, 5,3,5,2, false, false, true, false, false )
#     t4sv2 << melee(10, 3, 5,4,2,2, false, false, true, false, false )
# end
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)
#
# puts "versus t8sv3, an average of #{2.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{2.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{2.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{2.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{2.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{2.0*arySum(t4sv2)/atkExec} was done"
#
#
#


#
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   INFILS in melee    ********** "
#
# atkExec.times do
#     t8sv3 << melee(19, 3, 6,8,3,0, false, true, false, false, false )
#     t7sv3 << melee(19, 3, 6,7,3,0, false, true, false, false, false )
#     t4sv3 << melee(19, 3, 6,4,3,0, false, true, false, false, false )
#     t3sv4 << melee(19, 3, 6,3,4,0, false, true, false, false, false )
#     t3sv5 << melee(19, 3, 6,3,5,0, false, true, false, false, false )
#     t4sv2 << melee(19, 3, 6,4,2,0, false, true, false, false, false )
# end
#
#
#
# puts "versus t8sv3, an average of #{1.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{1.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{1.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{1.0*arySum(t4sv2)/atkExec} was done"
#
#
#
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   INFILS in shooting    ********** "
#
# atkExec.times do
#     t8sv3 << melee(25, 3, 3,8,3,0, false, false, false, false, false )
#     t7sv3 << melee(25, 3, 3,7,3,0, false, false, false, false, false )
#     t4sv3 << melee(25, 3, 3,4,3,0, false, false, false, false, false )
#     t3sv4 << melee(25, 3, 3,3,4,0, false, false, false, false, false )
#     t3sv5 << melee(25, 3, 3,3,5,0, false, false, false, false, false )
#     t4sv2 << melee(25, 3, 3,4,2,0, false, false, false, false, false )
# end
#
#
#
# puts "versus t8sv3, an average of #{1.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{1.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{1.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{1.0*arySum(t4sv2)/atkExec} was done"
#
#
#
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   PLASMAFRON with Overcharge   ********** "
#
# atkExec.times do
#     t8sv3 << melee(rand(1..6), 4, 8,8,3,3, false, false, false, true, true )
#     t7sv3 << melee(rand(1..6), 4, 8,7,3,3, false, false, false, true, true )
#     t4sv3 << melee(rand(1..6), 4, 8,4,3,3, false, false, false, true, true )
#     t3sv4 << melee(rand(1..6), 4, 8,3,4,3, false, false, false, true, true )
#     t3sv5 << melee(rand(1..6), 4, 8,3,5,3, false, false, false, true, true )
#     t4sv2 << melee(rand(1..6), 4, 8,4,2,3, false, false, false, true, true )
# end
#
#
#
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)
#
# puts "versus t8sv3, an average of #{2.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{2.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{2.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{2.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{2.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{2.0*arySum(t4sv2)/atkExec} was done"
#
#
#
# def overDeath
#     attacks = roll(rand(1..6))
#     ones = attacks.count(1)
#     attacks.delete(1)
#
#     ones.times do
#         attacks << rand(1..6)
#     end
#
#
#
#     return attacks.count(1)
# end
#
# howMany = []
# atkExec.times do
#     howMany << overDeath
# end
#
# # print howMany
# puts arySum(howMany)
#
# puts "odds of a plasmaFron dying with reroll 1s: #{1.0*arySum(howMany)/atkExec*100}%"
#
#
#
#
#
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   PLASMAFRON with lame made   ********** "
#
# atkExec.times do
#     t8sv3 << melee(rand(1..6), 4, 7,8,3,3, false, false, false, true, false )
#     t7sv3 << melee(rand(1..6), 4, 7,7,3,3, false, false, false, true, false )
#     t4sv3 << melee(rand(1..6), 4, 7,4,3,3, false, false, false, true, false )
#     t3sv4 << melee(rand(1..6), 4, 7,3,4,3, false, false, false, true, false )
#     t3sv5 << melee(rand(1..6), 4, 7,3,5,3, false, false, false, true, false )
#     t4sv2 << melee(rand(1..6), 4, 7,4,2,3, false, false, false, true, false )
# end
#
#
#
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)
#
# puts "versus t8sv3, an average of #{1.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{1.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{1.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{1.0*arySum(t4sv2)/atkExec} was done"
#
#
#
#
# # print attacks
# # puts "base hits #{attacks.length}"
#
# # puts "attacks: "
# # print attacks
# # puts " "
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# #
# #
# #
#
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   GRAAPHRON with D3   ********** "
#
# atkExec.times do
#     t8sv3 << melee(5, 4, 5,8,3,3, false, false, false, true, false )
#     t7sv3 << melee(5, 4, 5,7,3,3, false, false, false, true, false )
#     t4sv3 << melee(5, 4, 5,4,3,3, false, false, false, true, false )
#     t3sv4 << melee(5, 4, 5,3,4,3, false, false, false, true, false )
#     t3sv5 << melee(5, 4, 5,3,5,3, false, false, false, true, false )
#     t4sv2 << melee(5, 4, 5,4,2,3, false, false, false, true, false )
# end
#
#
#
#
#
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)
#
# puts "versus t8sv3, an average of #{2.0*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{2.0*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{2.0*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{1.0*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{1.0*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{2.0*arySum(t4sv2)/atkExec} was done"
#
#
#
#
# # def melee (atks, toHit, str,tuf,sv, rend, reroll, tesla, mortal)
#
# t8sv3 = []
# t7sv3 = []
# t4sv3 = []
# t3sv4 = []
# t3sv5 = []
# t4sv2 = []
# puts " ********   BALLISTARI in shooting    ********** "
#
# atkExec.times do
#     t8sv3 << melee(2, 3, 9,8,3,3, false, false, false, true, false)
#
#     t7sv3 << melee(2, 3, 9,7,3,3, false, false, false, true, false )
#
#     t4sv3 << melee(2, 3, 9,4,3,3, false, false, false, true, false )
#
#     t3sv4 << melee(2, 3, 9,3,4,3, false, false, false, true, false )
#
#     t3sv5 << melee(2, 3, 9,3,5,3, false, false, false, true, false )
#
#     t4sv2 << melee(2, 3, 9,4,2,3, false, false, false, true, false )
#
# end
#
#
#
# puts "versus t8sv3, an average of #{3.5*arySum(t8sv3)/atkExec} was done"
# puts "versus t7sv3, an average of #{3.5*arySum(t7sv3)/atkExec} was done"
# puts "versus t4sv3, an average of #{3.5*arySum(t4sv3)/atkExec} was done"
# puts "versus t3sv4, an average of #{3.5*arySum(t3sv4)/atkExec} was done"
# puts "versus t3sv5, an average of #{3.5*arySum(t3sv5)/atkExec} was done"
# puts "versus t4sv2, an average of #{3.5*arySum(t4sv2)/atkExec} was done"
