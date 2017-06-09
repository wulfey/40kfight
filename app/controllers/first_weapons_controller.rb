class FirstWeaponsController < ApplicationController
  before_action :set_first_weapon, only: [:show, :edit, :update, :destroy]

  # GET /first_weapons
  # GET /first_weapons.json
  def index
    @first_weapons = FirstWeapon.all
  end

  # GET /first_weapons/1
  # GET /first_weapons/1.json
  def show
  end

  # GET /first_weapons/new
  def new
    @first_weapon = FirstWeapon.new
  end

  # GET /first_weapons/1/edit
  def edit
  end

  # POST /first_weapons
  # POST /first_weapons.json
  def create
    @first_weapon = FirstWeapon.new(first_weapon_params)

    respond_to do |format|
      if @first_weapon.save
        format.html { redirect_to @first_weapon, notice: 'First weapon was successfully created.' }
        format.json { render :show, status: :created, location: @first_weapon }
      else
        format.html { render :new }
        format.json { render json: @first_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_weapons/1
  # PATCH/PUT /first_weapons/1.json
  def update
    respond_to do |format|
      if @first_weapon.update(first_weapon_params)
        format.html { redirect_to @first_weapon, notice: 'First weapon was successfully updated.' }
        format.json { render :show, status: :ok, location: @first_weapon }
      else
        format.html { render :edit }
        format.json { render json: @first_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_weapons/1
  # DELETE /first_weapons/1.json
  def destroy
    @first_weapon.destroy
    respond_to do |format|
      format.html { redirect_to first_weapons_url, notice: 'First weapon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_weapon
      @first_weapon = FirstWeapon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_weapon_params
      params.require(:first_weapon).permit(:ranged, :melee, :primaryAddedMeleeStr, :secondaryAddedMeleeStr, :primaryMeleeRend, :secondaryMeleeRend, :firstShootAttacks, :firstShootAttacksD3, :firstShootAttacksD6, :secondShootAttacks, :secondShootAttacksD3, :secondShootAttacksD6, :thirdShootAttacks, :fourthShootAttacks, :firstRange, :secondRange, :thirdRange, :fourthRange, :firstShootAttacks, :secondShootAttacks, :thirdShootAttacks, :fourthShootAttacks, :firstShootAttacksDamageD3, :firstShootAttacksDamageD6, :secondShootAttacksDamageD3, :secondShootAttacksDamageD6, :points)
    end
end
