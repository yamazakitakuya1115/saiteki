class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]

  def index
    @favorite_page = true
    favorite = Favorite.where(user_id: current_user.id).order('created_at DESC')
    @articles = []
    favorite.each do |fav|
      art_id = fav.article_id
      @articles << Article.find(art_id)
    end
  end

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      redirect_to action: :index
    end
  end

  def destroy
    favorite = Favorite.find_by(article_id: params[:id], user_id: current_user.id)
    favorite.destroy
    redirect_to action: :index
  end

  private

  def favorite_params
    params.permit().merge(article_id: params[:format].to_i, user_id: current_user.id)
  end

end
