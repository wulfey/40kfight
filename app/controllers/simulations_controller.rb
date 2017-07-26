class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]

  before_action :logged_in?
  before_action :get_messages


  # GET /simulations
  # GET /simulations.json
  def index
    @simulations = Simulation.all
  end

  # GET /simulations/1
  # GET /simulations/1.json
  def show

      @units = {}
      i = 1
      while i <= Unit.count
          @units[i] = Unit.find(i).name
          i+=1
      end

      @datasheets = {}
      i = 1
      while i <= Datasheet.count
          @datasheets[i] = Datasheet.find(i).name
          i+=1
      end


  end

  # GET /simulations/new
  def new
    @simulation = Simulation.new

  end

  # GET /simulations/1/edit
  def edit

  end

  # POST /simulations
  # POST /simulations.json
  def create
    @simulation = Simulation.new
    @simulation.user_id = current_user.id



    respond_to do |format|
      if @simulation.save
        format.html { redirect_to @simulation, notice: 'Simulation was successfully created.' }
        format.json { render :show, status: :created, location: @simulation }
      else
        format.html { render :new }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # get /simulations/:id/runAttack
  def any_attack
    @simulation = Simulation.find(params[:id])


    @weapons = params[:attacker][:weapons]
    @weapons.delete("")

    iter = params[:iterations].to_i
    if iter < 1
      iter = 1
    end
    if iter > 40
      iter = 40
    end


    @lastAG = @simulation.any_attack(@simulation.attacker, @simulation.target, iter, @weapons)



    # slots = @simulation.attacker.slots
    # redirect_to "/messages(#{res.results_array[0]})"
    # redirect_to "/messages(:content => '#{@lastAG.results.first.results_array[0]}')"
    if iter == 1
      for i in 1..@simulation.attacker.slots
        content = "Slot ##{i}: "
        @lastAG.results.each do |res|
          if res.slot == i
            content += " " + res.results_array[0] + " ---"
          end
        end
        message = current_user.messages.build(:content => content, :user_id => current_user.id)
        if message.save
          # ActionCable
          ActionCable.server.broadcast 'room_channel',
                                       content:  message.content,
                                       username: current_user.username

        end
      end
    else
      content = ""
      @lastAG.averages.each do |avg|
        content += " " + avg + " ---"
      end
      message = current_user.messages.build(:content => content, :user_id => current_user.id)
      if message.save
        # ActionCable
        ActionCable.server.broadcast 'room_channel',
                                     content:  message.content,
                                     username: current_user.username

      end
    end

# how woudl this work, link to? how do you get data out of a form

    # @lastAG.results.each do |res|
    #   message = current_user.messages.build(:content => res.results_array[0], :user_id => current_user.id)
    #   if message.save
    #
    #     # ActionCable
    #     ActionCable.server.broadcast 'room_channel',
    #                                  content:  message.content,
    #                                  username: current_user.username
    #
    #   # else
    #   #   render 'index'
    #   end
    # end
    # redirect_to @simulation


  end
  #
  # # get /simulations/:id/unit/:unit_id
  # def change_unit
  #   @simulation = Simulation.find(params[:id])
  #   @simulation.units = []
  #   @simulation.units << Unit.find(params[:unit_id])
  #   respond_to do |format|
  #     if @simulation.save
  #       format.html { redirect_to @simulation, notice: 'Attacker Updated.' }
  #       format.json { render :show, status: :ok, location: @simulation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @simulation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # get /simulations/:id/datasheet/:datasheet_id
  # def change_datasheet
  #   @simulation = Simulation.find(params[:id])
  #   @simulation.datasheets = []
  #   @simulation.datasheets << Datasheet.find(params[:datasheet_id])
  #   respond_to do |format|
  #     if @simulation.save
  #       format.html { redirect_to @simulation, notice: 'Target Updated.' }
  #       format.json { render :show, status: :ok, location: @simulation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @simulation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /simulations/1
  # PATCH/PUT /simulations/1.json
  def update
    respond_to do |format|
      if @simulation.update(simulation_params)
        format.html { redirect_to @simulation, notice: 'Simulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @simulation }
      else
        format.html { render :edit }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulations/1
  # DELETE /simulations/1.json
  def destroy
    @simulation.destroy
    respond_to do |format|
      format.html { redirect_to simulations_url, notice: 'Simulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation
      @simulation = Simulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_params
      params.require(:simulation).permit(:id, :user_id, :unit_id, :datasheet_id, :iterations, :attacker, :weapons, :iterations)
    end

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content, :username, :battle_id, :weapon, :slot_id)
    end
end
