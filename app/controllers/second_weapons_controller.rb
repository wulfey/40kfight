class SecondWeaponsController < ApplicationController
  before_action :set_second_weapon, only: [:show, :edit, :update, :destroy]

  # GET /second_weapons
  # GET /second_weapons.json
  def index
    @second_weapons = SecondWeapon.all
  end

  # GET /second_weapons/1
  # GET /second_weapons/1.json
  def show
  end

  # GET /second_weapons/new
  def new
    @second_weapon = SecondWeapon.new
  end

  # GET /second_weapons/1/edit
  def edit
  end

  # POST /second_weapons
  # POST /second_weapons.json
  def create
    @second_weapon = SecondWeapon.new(second_weapon_params)

    respond_to do |format|
      if @second_weapon.save
        format.html { redirect_to @second_weapon, notice: 'Second weapon was successfully created.' }
        format.json { render :show, status: :created, location: @second_weapon }
      else
        format.html { render :new }
        format.json { render json: @second_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /second_weapons/1
  # PATCH/PUT /second_weapons/1.json
  def update
    respond_to do |format|
      if @second_weapon.update(second_weapon_params)
        format.html { redirect_to @second_weapon, notice: 'Second weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: @second_weapon }
      else
        format.html { render :edit }
        format.json { render json: @second_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /second_weapons/1
  # DELETE /second_weapons/1.json
  def destroy
    @second_weapon.destroy
    respond_to do |format|
      format.html { redirect_to second_weapons_url, notice: 'Second weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second_weapon
      @second_weapon = SecondWeapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def second_weapon_params
      params.require(:second_weapon).permit(:ranged, :melee, :primaryAddedMeleeStr, :secondaryAddedMeleeStr, :primaryMeleeRend, :secondaryMeleeRend, :firstShootAttacks, :firstShootAttacksD3, :firstShootAttacksD6, :secondShootAttacks, :secondShootAttacksD3, :secondShootAttacksD6, :thirdShootAttacks, :fourthShootAttacks, :firstRange, :secondRange, :thirdRange, :fourthRange, :firstShootAttacks, :secondShootAttacks, :thirdShootAttacks, :fourthShootAttacks, :firstShootAttacksDamageD3, :firstShootAttacksDamageD6, :secondShootAttacksDamageD3, :secondShootAttacksDamageD6, :points)
    end
end
