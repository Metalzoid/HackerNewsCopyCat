class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @reaction = Reaction.new
  end
end
