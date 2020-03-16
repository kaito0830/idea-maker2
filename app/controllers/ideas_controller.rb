class IdeasController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)
    redirect_to ideas_path
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private  
  def idea_params
    params.require(:idea).permit(:title, :info, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
