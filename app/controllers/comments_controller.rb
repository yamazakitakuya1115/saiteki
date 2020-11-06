class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to "/articles/#{comment.article.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(article_id: params[:article_id].to_i, user_id: current_user.id)
  end
end