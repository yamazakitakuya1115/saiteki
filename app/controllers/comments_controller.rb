class CommentsController < ApplicationController

  def create
    if Comment.create(comment_params)
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.permit(:message).merge(article_id: params[:article_id].to_i, user_id: current_user.id)
  end
end