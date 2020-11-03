class ArticlesController < ApplicationController

  def index
  end

  def new
    @article = Article.new
  end

  def create
    binding.pry
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :grade_id, :subject_id, :genre_id, :content, :release).merge(user_id: current_user.id)
  end
end
