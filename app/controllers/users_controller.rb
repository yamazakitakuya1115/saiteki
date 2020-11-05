class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user_edit = true
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to root_path
    else
      binding.pry
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:account, :name, :tweet, :prefecture_id, :profile, :image, :email, :password).merge(id: current_user.id)
  end

end