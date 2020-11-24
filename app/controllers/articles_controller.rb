class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :set_articles, only: [:index, :grade, :subject, :genre]


  def index
    @index_page = true
  end

  def new
    @article = Article.new
    @articles_new_page = true
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
    if @article.release == false
      unless user_signed_in? && @article.user_id == current_user.id
        redirect_to root_path
      end
    end
    if user_signed_in? && @article.favorites.find_by(user_id: current_user.id)
      @favorite = true
    end
  end

  def edit
    @article_edit_page = true
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  def search
    if params[:part] == "title"
      @title_search = true
      @articles = Article.title_search(params[:keyword])
    end
    if params[:part] == "content"
      @content_search = true
      @articles = Article.content_search(params[:keyword])
    end
    @search_page = true
    @keyword = params[:keyword]
  end

  def grade
    @grade = Grade.find(params[:format])
  end

  def subject
    @subject = Subject.find(params[:format])
  end

  def genre
    @genre = Genre.find(params[:format])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :grade_id, :subject_id, :genre_id, :release).merge(user_id: current_user.id, content: params[:article][:content])
  end

  def set_article
    @article = Article.find(params[:id].to_i)
  end

  def set_articles
    @articles = Article.includes(:user).order('created_at DESC')
  end

  def move_to_index
    # ログインしている投稿したユーザー以外はリダイレクト
    unless user_signed_in? && @article.user_id == current_user.id
      redirect_to root_path
    end
  end

end