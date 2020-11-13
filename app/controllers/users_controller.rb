class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def show
    @user_show_page = true
    @tweet = Tweet.find_by(user_id: @user.id)
  end

  def edit
    @user_edit_page = true
  end

  def update
    @user_edit_page = true
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to root_path
    else
      render :edit
    end
  end

  def mine
    @mine_page = true
    @articles = Article.includes(:user).order('created_at DESC')
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:account, :name, :prefecture_id, :image, :email, :password).merge(id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && @user.id == current_user.id
      redirect_to root_path
    end
  end

end