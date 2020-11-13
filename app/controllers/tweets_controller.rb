class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def new
    if Tweet.find_by(user_id: current_user.id)
      redirect_to action: :edit, id: current_user.id
    end
  end

  def create
    tweet = Tweet.create(tweet_params)
    redirect_to user_path(current_user.id)
  end

  def edit
    @tweet = Tweet.find_by(user_id: current_user.id)
  end

  def update
    tweet = Tweet.find_by(user_id: current_user.id)
    tweet.update(tweet_update_params)
    redirect_to user_path(current_user.id)
  end


  private

  def tweet_params
    params.permit(:hitokoto, :profile).merge(user_id: current_user.id)
  end

  def tweet_update_params
    params.require(:tweet).permit(:hitokoto, :profile).merge(user_id: current_user.id)
  end
end