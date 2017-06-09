class ValidDetachmentsController < ApplicationController
  before_action :set_valid_detachment, only: [:show, :edit, :update, :destroy]

  # GET /valid_detachments
  # GET /valid_detachments.json
  def index
    @valid_detachments = ValidDetachment.all
  end

  # GET /valid_detachments/1
  # GET /valid_detachments/1.json
  def show
  end

  # GET /valid_detachments/new
  def new
    @valid_detachment = ValidDetachment.new
  end

  # GET /valid_detachments/1/edit
  def edit
  end

  # POST /valid_detachments
  # POST /valid_detachments.json
  def create
    @valid_detachment = ValidDetachment.new(valid_detachment_params)

    respond_to do |format|
      if @valid_detachment.save
        format.html { redirect_to @valid_detachment, notice: 'Valid detachment was successfully created.' }
        format.json { render :show, status: :created, location: @valid_detachment }
      else
        format.html { render :new }
        format.json { render json: @valid_detachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valid_detachments/1
  # PATCH/PUT /valid_detachments/1.json
  def update
    respond_to do |format|
      if @valid_detachment.update(valid_detachment_params)
        format.html { redirect_to @valid_detachment, notice: 'Valid detachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @valid_detachment }
      else
        format.html { render :edit }
        format.json { render json: @valid_detachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valid_detachments/1
  # DELETE /valid_detachments/1.json
  def destroy
    @valid_detachment.destroy
    respond_to do |format|
      format.html { redirect_to valid_detachments_url, notice: 'Valid detachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valid_detachment
      @valid_detachment = ValidDetachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valid_detachment_params
      params.require(:valid_detachment).permit(:name, :command_points, :min_troops, :min_elites, :min_fast, :min_heavy, :min_hq, :min_lord, :min_flyer, :dedicated_allowed, :max_troops, :max_elites, :max_fast, :max_heavy, :max_hq, :max_lord, :max_flyer)
    end
end
