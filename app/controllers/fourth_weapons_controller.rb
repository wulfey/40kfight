class FourthWeaponsController < ApplicationController
  before_action :set_fourth_weapon, only: [:show, :edit, :update, :destroy]

  # GET /fourth_weapons
  # GET /fourth_weapons.json
  def index
    @fourth_weapons = FourthWeapon.all
  end

  # GET /fourth_weapons/1
  # GET /fourth_weapons/1.json
  def show
  end

  # GET /fourth_weapons/new
  def new
    @fourth_weapon = FourthWeapon.new
  end

  # GET /fourth_weapons/1/edit
  def edit
  end

  # POST /fourth_weapons
  # POST /fourth_weapons.json
  def create
    @fourth_weapon = FourthWeapon.new(fourth_weapon_params)

    respond_to do |format|
      if @fourth_weapon.save
        format.html { redirect_to @fourth_weapon, notice: 'Fourth weapon was successfully created.' }
        format.json { render :show, status: :created, location: @fourth_weapon }
      else
        format.html { render :new }
        format.json { render json: @fourth_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fourth_weapons/1
  # PATCH/PUT /fourth_weapons/1.json
  def update
    respond_to do |format|
      if @fourth_weapon.update(fourth_weapon_params)
        format.html { redirect_to @fourth_weapon, notice: 'Fourth weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: @fourth_weapon }
      else
        format.html { render :edit }
        format.json { render json: @fourth_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fourth_weapons/1
  # DELETE /fourth_weapons/1.json
  def destroy
    @fourth_weapon.destroy
    respond_to do |format|
      format.html { redirect_to fourth_weapons_url, notice: 'Fourth weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fourth_weapon
      @fourth_weapon = FourthWeapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fourth_weapon_params
      params.require(:fourth_weapon).permit(:ranged, :melee, :primaryAddedMeleeStr, :secondaryAddedMeleeStr, :primaryMeleeRend, :secondaryMeleeRend, :firstShootAttacks, :firstShootAttacksD3, :firstShootAttacksD6, :secondShootAttacks, :secondShootAttacksD3, :secondShootAttacksD6, :thirdShootAttacks, :fourthShootAttacks, :firstRange, :secondRange, :thirdRange, :fourthRange, :firstShootAttacks, :secondShootAttacks, :thirdShootAttacks, :fourthShootAttacks, :firstShootAttacksDamageD3, :firstShootAttacksDamageD6, :secondShootAttacksDamageD3, :secondShootAttacksDamageD6, :points)
    end
end
