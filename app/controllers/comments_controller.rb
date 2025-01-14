class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    @comment.user = current_user
    @comment.interactable = params[:post_id]
  end

  def destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
