


class Simulation < ApplicationRecord

  belongs_to :battle

  belongs_to :attacker, class_name: 'Unit', foreign_key: 'attacker_id'
  belongs_to :target, class_name: 'Unit', foreign_key: 'target_id'

  accepts_nested_attributes_for :attacker, :target
  has_many :attack_groups, dependent: :destroy
  has_many :results, :through => :attack_groups, dependent: :destroy

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

    def runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wepID, wepDAMd3, wepDAMd6, res, iterations)

        wep = Weapon.find(wepID)


        attackerAbilites = []
        a.abilities.each do |abil|
          attackerAbilites << abil
        end
        wep.abilities.each do |abil|
          attackerAbilites << abil
        end

        targetAbilities = []
        t.abilities.each do |abil|
          targetAbilities << abil
        end


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

        models = t.min_model_count * iterations
        tWounds = t.wounds
        modelArray = []
        models.times do
          modelArray << tWounds
        end
        damageDealt = 0
        kills = 0

        baseDmg = dmg
        # overKill = 0
        failedSaves.times do
          if modelArray[0] == nil
            break
          else
            dmg = baseDmg
            if wepDAMd3
              dmg = 0
              baseDmg.times do
                dmg += d3
              end
            elsif wepDAMd6
              dmg = 0
              baseDmg.times do
                dmg += d6
              end
            end
            # TODO handle all the special rules damage modifiers here
            modelArray[0] -= dmg
            damageDealt += dmg
            if modelArray[0] < 1
              kills += 1
              damageDealt += modelArray[0]
              modelArray.shift
            end
          end
        end


        text = "#{Weapon.find(wepID).name}: #{atks} attacks by #{a.min_model_count} #{a.name} against #{t.min_model_count}  #{t.name} hit #{attack_roll.count} times and wounded #{wound_roll.count} times  with #{failedSaves} failed saves. Dealt #{damageDealt}, thereby killing #{kills} models."

        if attackerAbilites.count > 0 || targetAbilities.count > 0
          unhandled = "UNHANDLED: "
          attackerAbilites.each do |abil|
            unhandled += ", a.#{abil}"
          end
          targetAbilities.each do |abil|
            unhandled += ", t.#{abil}"
          end
          unhandled += ".  "
          text += unhandled
        end







        res.hitCount += attack_roll.count
        res.woundCount += wound_roll.count
        res.weaponName = Weapon.find(wepID).name
        res.failedSaves += failedSaves
        res.kills += kills
        res.results_array << text
        res.woundsdealt += damageDealt
        res.attacker = a.name
        res.target = t.name





        # ALLOCATE WOUNDS

        # GENERATE AND SAVE RESULTS

    end

# *****************************************************************
# *****************************************************************
# *****************************************************************
  def any_attack(a, t, iterations, weapons)
    #   a = attack, t = target
    ag = AttackGroup.new(attacker: a.name, target: t.name)
    self.attack_groups << ag
    self.save

    selected_weapons = []
    weapons.each do |id|
      selected_weapons << Weapon.find(id)
    end

    iterations = iterations.to_i

    # for i in 1..iterations
      selected_weapons.each do |wep|
        res = Result.new


        res.slot = wep.slot


        # get first subweapon parameters
        # this is a hack, iterations is just multiplying the attack counts, we divide later
        atks = wep.firstShootAttacks * iterations
        str = wep.firstShootStrength
        rend = wep.firstShootRend
        wepd3 = wep.firstShootAttacksD3
        wepd6 = wep.firstShootAttacksD6
        dmg = wep.firstShootDamage
        wepDAMd3 = wep.firstShootAttacksDamageD3
        wepDAMd6 = wep.firstShootAttacksDamageD6
        abilities = wep.abilities

        if wep.allequipped
          atks = atks * a.min_model_count
        end


        runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6, res, iterations)

        # second weapon check
        if wep.secondShootAttacks > 0
            atks = wep.secondShootAttacks * iterations
            str = wep.secondShootStrength
            rend = wep.secondShootRend
            wepd3 = wep.secondShootAttacksD3
            wepd6 = wep.secondShootAttacksD6
            dmg = wep.secondShootDamage
            wepDAMd3 = wep.secondShootAttacksDamageD3
            wepDAMd6 = wep.secondShootAttacksDamageD6
            abilites = wep.abilities_second
            if wep.allequipped
              atks = atks * a.min_model_count
            end
            runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6, res, iterations)
        end
        # third weapon check
        if wep.thirdShootAttacks > 0
            atks = wep.thirdShootAttacks * iterations
            str = wep.thirdShootStrength
            rend = wep.thirdShootRend
            wepd3 = 0
            wepd6 = 0
            abilities = wep.abilities_third
            dmg = wep.thirdShootDamage
            wepDAMd3 = 0
            wepDAMd6 = 0
            if wep.allequipped
              atks = atks * a.min_model_count
            end
            runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6, res, iterations)
        end
        # fourth weapon check
        if wep.fourthShootAttacks > 0
            atks = wep.fourthShootAttacks * iterations
            str = wep.fourthShootStrength
            rend = wep.fourthShootRend
            wepd3 = 0
            wepd6 = 0
            abilities = wep.abilities_fourth
            dmg = wep.fourthShootDamage
            wepDAMd3 = 0
            wepDAMd6 = 0
            if wep.allequipped
              atks = atks * a.min_model_count
            end
            runAttack(a, t, atks, str, rend, dmg, wepd3, wepd6, abilities, wep.id, wepDAMd3, wepDAMd6, res, iterations)
        end


        self.attack_groups.last.results << res
        self.save

      end
    # end

    iterations *= 1.0

    if iterations > 1

      # go through and find all the names in the attack group
      wepHash = {}

      self.attack_groups.last.results.each do |res|
        wepHash[res.weaponName] = [0,0,0,0,0]
        # hitCount,woundCount,failedSaves,woundsdealt,kills
      end


      self.attack_groups.last.results.each do |res|
        wepHash[res.weaponName][0] += res.hitCount
        wepHash[res.weaponName][1] += res.woundCount
        wepHash[res.weaponName][2] += res.failedSaves
        wepHash[res.weaponName][3] += res.woundsdealt
        wepHash[res.weaponName][4] += res.kills
      end

      #
      # puts "**************************************"
      # print wepHash
      # puts ""
      # puts "**************************************"


      ary = []
      wepHash.each do |namedWeapon|

        averageText = "Averages for #{iterations.to_i} attacks by #{a.min_model_count} #{a.name} against #{t.min_model_count}  #{t.name} using #{namedWeapon[0]}:  avg #{(namedWeapon[1][0]/iterations).round(2)} hits with  #{(namedWeapon[1][1]/iterations).round(2)} wounds, and #{(namedWeapon[1][2]/iterations).round(2)} failed saves. Dealt #{(namedWeapon[1][3]/iterations).round(2)}, thereby killing average of #{(namedWeapon[1][4]/iterations).round(2)} models."

        # puts "**************************************"
        # print averageText
        # puts ""
        # puts "**************************************"
        ary << averageText
      end



      # puts "**************************************"
      # print ary
      # puts ""
      # puts "**************************************"

      ag = self.attack_groups.last
      ag.averages = ary
      ag.save

      # puts "**************************************"
      # print self.attack_groups.last.averages
      # puts ""
      # puts "**************************************"


    end

    return self.attack_groups.last
  end


end
