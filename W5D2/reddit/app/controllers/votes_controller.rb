class VotesController < ApplicationController
  before_action :require_current_user

  def create
    @vote = Vote.new(vote_params)

    @vote.voter_id = current_user.id
    @vote.votable_id = params[:comment_id] ? params[:comment_id] : params[:post_id]
    @vote.votable_type = params[:comment_id] ? "Comment" : "Post"
    old_vote = Vote.find_by(voter_id: @vote.voter_id, votable_id: @vote.votable_id, votable_type: @vote.votable_type)
    old_vote.destroy if old_vote
    # fail
    if @vote.save
      if @vote.votable_type == "Comment"
        redirect_to comment_url(@vote.votable_id)
      else
        redirect_to post_url(@vote.votable_id)
      end
    elsif @vote.votable_type == "Comment"
      flash[:errors] = @vote.errors.full_messages
      redirect_to comment_url(@vote.votable_id)
    else
      flash[:errors] = @vote.errors.full_messages
      redirect_to post_url(@vote.votable_id)
    end
  end

  def vote_params
    params.require(:vote).permit(:value)
  end

end
