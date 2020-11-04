class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
    @index_page = true
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @show_page = true
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :grade_id, :subject_id, :genre_id, :content, :release).merge(user_id: current_user.id)
  end
end