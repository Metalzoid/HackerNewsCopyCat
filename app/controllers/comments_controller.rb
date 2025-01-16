class CommentsController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(comments_params)
    @comment.user = current_user
    @comment.interactable = @post
    @reaction = Reaction.new
    if @comment.save
      respond_to do |format|
        format.turbo_stream do
           render turbo_stream: turbo_stream.append(:comments, partial: "posts/comment",
            target: "comments", locals: { comment: @comment, post: @post, reaction: @reaction })
        end
        format.html { redirect_to post_path(@post) }
      end
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end
end
