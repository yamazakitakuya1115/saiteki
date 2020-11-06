class UsersController < ApplicationController

  def show
    @user_show_page = true
    @user = User.find(params[:id])
  end

  def edit
    @user_edit_page = true
    @user = User.find(params[:id])
  end

  def update
    @user_edit_page = true
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to root_path
    else
      render :edit
    end
  end

  def mine
    @articles = Article.includes(:user).order('created_at DESC')
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:account, :name, :tweet, :prefecture_id, :profile, :image, :email, :password).merge(id: current_user.id)
  end

end