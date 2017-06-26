# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues

* Deployment instructions

* ...


OKAY RETHINK THE MODEL

DATASHEET
    Many attributes
    slots
    xxx
    slot

rails generate scaffold Weapon datasheet_name:string name:string slot:integer ranged:boolean melee:boolean primaryAddedMeleeStr:integer secondaryAddedMeleeStr:integer primaryMeleeRend:integer secondaryMeleeRend:integer firstShootAttacks:integer firstShootAttacksD3:boolean firstShootAttacksD6:boolean secondShootAttacks:integer secondShootAttacksD3:boolean secondShootAttacksD6:boolean thirdShootAttacks:integer fourthShootAttacks:integer firstRange:integer secondRange:integer thirdRange:integer fourthRange:integer firstShootAttacksDamageD3:boolean firstShootAttacksDamageD6:boolean secondShootAttacksDamageD3:boolean secondShootAttacksDamageD6:boolean points:integer firstShootDamage:integer secondShootDamage:integer thirdShootDamage:integer fourthShootDamage:integer  firstShootRend:integer secondShootRend:integer thirdShootRend:integer fourthShootRend:integer firstShootStrength:integer secondShootStrength:integer thirdShootStrength:integer fourthShootStrength:integer


change_column_default

      add_column :units
