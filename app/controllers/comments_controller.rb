class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if !@comment.save
      flash[:error] = "Cannot post a blank comment."
    end
    redirect_to wall_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(message_id: params[:message_id])
  end

end
