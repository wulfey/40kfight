class MessagesController < ApplicationController
  before_action :logged_in?
  before_action :get_messages

  def index
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save

      # ActionCable
      ActionCable.server.broadcast 'room_channel',
                                   content:  message.content,
                                   username: message.user.username

    # else
    #   render 'index'
    end
  end


  def clear_messages
    Message.where(:user_id == params[:user_id]).destroy_all


    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Results successfully cleared.' }
      format.json { head :no_content }
    end
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content, :username, :user_id)
    end
end
