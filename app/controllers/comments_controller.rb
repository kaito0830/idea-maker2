class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comments = Comment.all
    if @comment.save
      @comment = Comment.new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end
end
