class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(idea_id: params[:idea_id])
    
  end

  def destroy
    like = current_user.likes.find_by(idea_id: params[:idea_id], user_id: current_user.id)
    like.destroy
  end

  def set_variables
    @idea = Idea.find(params[:idea_id])
    @id_name = "#like-link-#{@idea.id}"
  end
end
