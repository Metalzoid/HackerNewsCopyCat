class VotesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    new_vote = Vote.create(user: current_user, interactable: post)
    if new_vote.save
      redirect_to root_path, voted: "Votre vote à bien été ajouté ! 🔥"
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id])
    if vote.destroy
      redirect_to root_path, unvoted: "Votre vote à bien été retiré 😢"
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end
end
