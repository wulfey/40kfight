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

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content, :username)
    end
end