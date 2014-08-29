class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    if !@message.save
      flash[:error] = "Cannot post a blank message."
    end
    redirect_to wall_path
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end

end
