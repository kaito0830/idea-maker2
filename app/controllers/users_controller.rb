class UsersController < ApplicationController
  def index
    @users = User.all
    @all_ranks = User.find(Like.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
  end

  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を編集しました。"
      redirect_to("/")
    else
      flash.now[danger] = "ユーザー情報の編集に失敗しました。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
