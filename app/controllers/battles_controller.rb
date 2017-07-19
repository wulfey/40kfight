class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :get_messages

  # GET /battles
  # GET /battles.json
  def index
    @battles = Battle.where(:user_id => current_user.id)
    @datasheets = Datasheet.all
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
    @simulations = Simulation.where(:user_id => current_user.id)
    @datasheets = Datasheet.all
  end

  # GET /battles/new
  def new
    @battle = Battle.new
  end

  # GET /battles/1/edit
  def edit
    @battle = Battle.find(params[:id])
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(params.require(:battle).permit(:name))
    @battle.user_id = current_user.id

    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render :show, status: :created, location: @battle }
      else
        format.html { render :new }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end


  # post   '/battles/:id',   to: 'battles#add_simulation'
  def add_simulation
    @battle = Battle.find(params[:id])
    simulation = Simulation.new


    atk = params[:simulation][:attacker].to_i
    targ = params[:simulation][:target].to_i
    simulation.attacker = Unit.find(atk)
    simulation.target = Unit.find(targ)
    simulation.user_id = current_user.id
    simulation.battle_id = @battle.id
    simulation.save!

    @battle.simulations << simulation
    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'Simulation successfully added to Battle.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /battles/1
  # PATCH/PUT /battles/1.json
  def update
    respond_to do |format|
      if @battle.update(params.require(:battle).permit(:name))
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url, notice: 'Battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # get /battles/:id/datasheet/:datasheet_id/:team
  def change_unit
    @battle = Battle.find(params[:id])
    @datasheet = Datasheet.find_by(id: params[:datasheet_id])
    @unit = Unit.new
    @unit.name = @datasheet.name
    @unit.role = @datasheet.role
    @unit.power = @datasheet.power
    @unit.movement = @datasheet.movement
    @unit.shooting_skill = @datasheet.shooting_skill
    @unit.strength = @datasheet.strength
    @unit.combat_skill = @datasheet.combat_skill
    @unit.attacks = @datasheet.attacks
    @unit.wounds = @datasheet.wounds
    @unit.leadership = @datasheet.leadership
    @unit.armor_save = @datasheet.armor_save
    @unit.invul_shooting = @datasheet.invul_shooting
    @unit.invul_combat = @datasheet.invul_combat
    @unit.single_model_point_cost = @datasheet.single_model_point_cost
    @unit.model_count_increment = @datasheet.model_count_increment
    @unit.power_for_each_increment = @datasheet.power_for_each_increment
    @unit.min_model_count = @datasheet.min_model_count
    @unit.max_model_count = @datasheet.max_model_count
    @unit.slots = @datasheet.slots
    @unit.toughness = @datasheet.toughness
    @unit.fnp = @datasheet.fnp
    @unit.faction_keywords = @datasheet.faction_keywords
    @unit.keywords = @datasheet.keywords
    @unit.abilities = @datasheet.abilities

    @unit.team = params[:team]

    @datasheet.weapons.each do |wep|
      @unit.weapons << wep
    end

    @battle.units << @unit

    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'Unit was successfully added.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # get   '/battles/:id/unit/:unit_id',   to: 'battles#remove_unit'
  def remove_unit
    @battle = Battle.find(params[:id])
    @unit = Unit.find(params[:unit_id])

    Simulation.where(:attacker_id == @unit.id && :battle_id == @battle.id).destroy_all
    Simulation.where(:target_id == @unit.id && :battle_id == @battle.id).destroy_all

    Unit.find(params[:unit_id]).destroy!



    respond_to do |format|
      if @battle.save
        format.html { redirect_to @battle, notice: 'Unit was successfully Removed.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params.permit(:battle, :id, :name, :user_id, :datasheet_id, :team, :unit_id, :attacker, :simulation, :target)
    end

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end
end
