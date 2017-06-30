class Simulation < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :units
  has_and_belongs_to_many :datasheets
  has_many :results

    def d6
      rand(1..6)
    end

    def d3
      rand(1..3)
    end

    def toWoundCalc(str,tuf)
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


    def reroll(n, tomeet)
      ary = roll(n)

      rerollCount = 0
      while a[0] != nil && a[0] < tomeet
          rerollCount += 1
          a.shift
      end
      rerollCount.times do
          ary << d6
      end
      ary.sort!
      return ary

    end

    def arySum(ary)
      sum = 0
      ary.each do |d|
          sum += d
      end
      return sum
    end

    def roll(n)
      ary = []
      n.times do
          ary << rand(1..6)
      end
      ary.sort!
      return ary
    end

# result
# attacker: string, target: string, string: string, dice: integer, description: text, woundsdealt: integer, average: float, toughness: integer, armor: integer, invul: integer,

    def runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wepID, wepDAMd3, wepDAMd6)


        wep = Weapon.find(wepID)

        ranged = true
        skill = a.shooting_skill

        if wep.melee
            ranged = false
            skill = a.combat_skill
        end


        # get target parameters, same each subweapon
        tough = t.toughness
        wounds = t.wounds
        target_models = t.min_model_count
        invul_shooting = t.invul_shooting
        invul_combat = t.invul_combat



        # D3 and D6 attacks handling
        if wepd3
          sum = 0
          atks.times do
              sum += d3
          end
          atks = sum
        end
        if wep.firstShootAttacksD6
          sum = 0
          atks.times do
              sum += d6
          end
          atks = sum
        end

        # ATTACK ROLL
        attack_roll = []



        # roll the attack roll
        attack_roll = roll(atks)
        puts "The attack rolls are: #{attack_roll}, must meet #{skill}. From weapon: #{Weapon.find(wepID).name}"

        # TODO Aura/reroll handling

        # TODO modifier handling


        # remove misses based on skills
        attack_roll.sort!
        while attack_roll[0] != nil && attack_roll[0] < skill
            attack_roll.shift
        end


        # get the needed wound roll
        woundNeeded = toWoundCalc(str, tough)
        # roll the wound roll
        wound_roll = roll(attack_roll.count)
        puts "The wound rolls are: #{wound_roll}, must meet #{woundNeeded} from strength: #{str}"



        # TODO wound rerolls and abilites

        # eliminate failed rolls
        wound_roll.sort!
        while wound_roll[0] != nil && wound_roll[0] < woundNeeded
            wound_roll.shift
        end


        # get saveValue
        rended_save = t.armor_save + rend
        saveValue = rended_save
        if ranged
            if invul_shooting < saveValue
                saveValue = invul_shooting
            end
        else
            if invul_combat < saveValue
                saveValue = invul_combat
            end
        end

        save_roll = roll(wound_roll.count)
        puts "The save rolls are: #{save_roll}, must meet #{saveValue} on rend: #{rend}"

        failedSaves = 0
        save_roll.sort!
        while save_roll[0] != nil && save_roll[0] < saveValue
            save_roll.shift
            failedSaves += 1
        end


        # TODO handle multiple wound allocations over the target

        puts "Attack by #{a.name} against #{t.name} wounded #{failedSaves} times."

        
        # ALLOCATE WOUNDS

        # GENERATE AND SAVE RESULTS

    end

    def any_attack(a, t)
    #   a = attack, t = target
    a.weapons.each do |wep|
        # res = Result.new



        # get first subweapon parameters
        atks = wep.firstShootAttacks
        str = wep.firstShootStrength
        rend = wep.firstShootRend
        wepd3 = wep.firstShootAttacksD3
        wepd6 = wep.firstShootAttacksD6
        dmg = wep.firstShootDamage
        wepDAMd3 = wep.firstShootAttacksDamageD3
        wepDAMd6 = wep.firstShootAttacksDamageD6
        abilities = wep.abilities


        runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6)

        # second weapon check
        if wep.secondShootAttacks > 0
            atks = wep.secondShootAttacks
            str = wep.secondShootStrength
            rend = wep.secondShootRend
            wepd3 = wep.secondShootAttacksD3
            wepd6 = wep.secondShootAttacksD6
            dmg = wep.secondShootDamage
            wepDAMd3 = wep.secondShootAttacksDamageD3
            wepDAMd6 = wep.secondShootAttacksDamageD6
            abilites = wep.abilities_second
            runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6)
        end
        # third weapon check
        if wep.thirdShootAttacks > 0
            atks = wep.thirdShootAttacks
            str = wep.thirdShootStrength
            rend = wep.thirdShootRend
            wepd3 = wep.thirdShootAttacksD3
            wepd6 = wep.thirdShootAttacksD6
            abilities = wep.abilities_third
            dmg = wep.thirdShootDamage
            wepDAMd3 = 0
            wepDAMd6 = 0
            runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6)
        end
        # fourth weapon check
        if wep.fourthShootAttacks > 0
            atks = wep.fourthShootAttacks
            str = wep.fourthShootStrength
            rend = wep.fourthShootRend
            wepd3 = wep.fourthShootAttacksD3
            wepd6 = wep.fourthShootAttacksD6
            abilities = wep.abilities_fourth
            dmg = wep.fourthShootDamage
            wepDAMd3 = 0
            wepDAMd6 = 0
            runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6)
        end

    end

  end


end
