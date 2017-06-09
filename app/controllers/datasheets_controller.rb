class DatasheetsController < ApplicationController
  before_action :set_datasheet, only: [:show, :edit, :update, :destroy]

  # GET /datasheets
  # GET /datasheets.json
  def index
    @datasheets = Datasheet.all
  end

  # GET /datasheets/1
  # GET /datasheets/1.json
  def show
  end

  # GET /datasheets/new
  def new
    @datasheet = Datasheet.new
  end

  # GET /datasheets/1/edit
  def edit
  end

  # POST /datasheets
  # POST /datasheets.json
  def create
    @datasheet = Datasheet.new(datasheet_params)

    respond_to do |format|
      if @datasheet.save
        format.html { redirect_to @datasheet, notice: 'Datasheet was successfully created.' }
        format.json { render :show, status: :created, location: @datasheet }
      else
        format.html { render :new }
        format.json { render json: @datasheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasheets/1
  # PATCH/PUT /datasheets/1.json
  def update
    respond_to do |format|
      if @datasheet.update(datasheet_params)
        format.html { redirect_to @datasheet, notice: 'Datasheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @datasheet }
      else
        format.html { render :edit }
        format.json { render json: @datasheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasheets/1
  # DELETE /datasheets/1.json
  def destroy
    @datasheet.destroy
    respond_to do |format|
      format.html { redirect_to datasheets_url, notice: 'Datasheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datasheet
      @datasheet = Datasheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datasheet_params
      params.require(:datasheet).permit(:name, :role, :power, :movemovent, :shooting_skill, :strength, :combat_skill, :attacks, :wounds, :leadership, :armor_save, :invul_shooting, :invul_combat, :single_model_point_cost, :model_count_increment, :power_for_each_increment, :min_model_count, :max_model_count, :first_slot, :second_slot, :third_slot, :fourth_slot)
    end
end
