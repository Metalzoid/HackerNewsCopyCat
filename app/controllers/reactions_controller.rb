class ReactionsController < ApplicationController
  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @reaction = Reaction.new(reactions_params)
    @reaction.interactable = @comment
    @reaction.user = current_user
    @post = Post.find_by(id: @comment.interactable.id)
    if @reaction.save
      redirect_to post_path(@comment.interactable)
    else
      redirect_to post_path(@comment.interactable), status: :unprocessable_entity
    end
  end

  private

  def reactions_params
    params.require(:reaction).permit(:content)
  end
end
