class CommentsController < ApplicationController

  def index
    if params.has_key?(:user_id)
      comments = User.joins(:comments).where("comments.user_id = #{params[:user_id]}")
      render json: comments
    elsif params.has_key?(:artwork_id)
      comments = Artwork.joins(:comments).where("comments.artwork_id = #{params[:artwork_id]}")
      render json: comments
    else
      render plain: 'You do not have permission to check all comments'
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])
    if comment
      if comment.update(comment_params)
        render json: comment
      else
        render json: comment.errors.full_messages, status: 422
      end
    else
      render plain: 'Cannot find such comment'
    end
  end

  def show
    comment = Comment.find_by(id: params[:id])
    if comment
      render json: comment
    else
      render plain: 'Cannot find such comment'
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment
      comment.destroy
      render json: Comment.all
    else
      render plain: 'Cannot find such comment'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
