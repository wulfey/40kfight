class ThirdWeaponsController < ApplicationController
  before_action :set_third_weapon, only: [:show, :edit, :update, :destroy]

  # GET /third_weapons
  # GET /third_weapons.json
  def index
    @third_weapons = ThirdWeapon.all
  end

  # GET /third_weapons/1
  # GET /third_weapons/1.json
  def show
  end

  # GET /third_weapons/new
  def new
    @third_weapon = ThirdWeapon.new
  end

  # GET /third_weapons/1/edit
  def edit
  end

  # POST /third_weapons
  # POST /third_weapons.json
  def create
    @third_weapon = ThirdWeapon.new(third_weapon_params)

    respond_to do |format|
      if @third_weapon.save
        format.html { redirect_to @third_weapon, notice: 'Third weapon was successfully created.' }
        format.json { render :show, status: :created, location: @third_weapon }
      else
        format.html { render :new }
        format.json { render json: @third_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /third_weapons/1
  # PATCH/PUT /third_weapons/1.json
  def update
    respond_to do |format|
      if @third_weapon.update(third_weapon_params)
        format.html { redirect_to @third_weapon, notice: 'Third weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: @third_weapon }
      else
        format.html { render :edit }
        format.json { render json: @third_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /third_weapons/1
  # DELETE /third_weapons/1.json
  def destroy
    @third_weapon.destroy
    respond_to do |format|
      format.html { redirect_to third_weapons_url, notice: 'Third weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third_weapon
      @third_weapon = ThirdWeapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def third_weapon_params
      params.require(:third_weapon).permit(:ranged, :melee, :primaryAddedMeleeStr, :secondaryAddedMeleeStr, :primaryMeleeRend, :secondaryMeleeRend, :firstShootAttacks, :firstShootAttacksD3, :firstShootAttacksD6, :secondShootAttacks, :secondShootAttacksD3, :secondShootAttacksD6, :thirdShootAttacks, :fourthShootAttacks, :firstRange, :secondRange, :thirdRange, :fourthRange, :firstShootAttacks, :secondShootAttacks, :thirdShootAttacks, :fourthShootAttacks, :firstShootAttacksDamageD3, :firstShootAttacksDamageD6, :secondShootAttacksDamageD3, :secondShootAttacksDamageD6, :points)
    end
end
