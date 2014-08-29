class WallController < ApplicationController
  def index
    @user = current_user
    @message = @user.messages.build
    @comment = Comment.new
    @all_messages = Message.all.order('created_at desc')
  end
end
