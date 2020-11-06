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
    @comments = Comment.includes(:article)
  end

  def edit
    @article_edit_page = true
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    article = Article.find(params[:id])
    if article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :grade_id, :subject_id, :genre_id, :content, :release).merge(user_id: current_user.id)
  end
end