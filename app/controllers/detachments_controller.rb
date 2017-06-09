class DetachmentsController < ApplicationController
  before_action :set_detachment, only: [:show, :edit, :update, :destroy]

  # GET /detachments
  # GET /detachments.json
  def index
    @detachments = Detachment.all
  end

  # GET /detachments/1
  # GET /detachments/1.json
  def show
  end

  # GET /detachments/new
  def new
    @detachment = Detachment.new
  end

  # GET /detachments/1/edit
  def edit
  end

  # POST /detachments
  # POST /detachments.json
  def create
    @detachment = Detachment.new(detachment_params)

    respond_to do |format|
      if @detachment.save
        format.html { redirect_to @detachment, notice: 'Detachment was successfully created.' }
        format.json { render :show, status: :created, location: @detachment }
      else
        format.html { render :new }
        format.json { render json: @detachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detachments/1
  # PATCH/PUT /detachments/1.json
  def update
    respond_to do |format|
      if @detachment.update(detachment_params)
        format.html { redirect_to @detachment, notice: 'Detachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @detachment }
      else
        format.html { render :edit }
        format.json { render json: @detachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detachments/1
  # DELETE /detachments/1.json
  def destroy
    @detachment.destroy
    respond_to do |format|
      format.html { redirect_to detachments_url, notice: 'Detachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detachment
      @detachment = Detachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detachment_params
      params.require(:detachment).permit(:name, :command_points, :min_troops, :min_elites, :min_fast, :min_heavy, :min_hq, :min_lord, :min_flyer, :dedicated_allowed, :max_troops, :max_elites, :max_fast, :max_heavy, :max_hq, :max_lord, :max_flyer, :list_id)
    end
end
