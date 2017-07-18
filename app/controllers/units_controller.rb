class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  # GET /units
  # GET /units.json
  def index
    @units = Unit.all
  end

  # GET /units/1
  # GET /units/1.json
  def show
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @datasheet = Datasheet.find_by(name: params[:name])
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

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully create@datasheet.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully update@datasheet.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroye@datasheet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :role, :power, :movement, :shooting_skill, :strength, :combat_skill, :attacks, :wounds, :leadership, :armor_save, :invul_shooting, :invul_combat, :single_model_point_cost, :model_count_increment, :power_for_each_increment, :min_model_count, :max_model_count, :detachment_id)
    end
end
