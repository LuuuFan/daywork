class CommentsController < ApplicationController
  before_action :require_current_user

  def show
    @comment = Comment.find_by(id: params[:id])

  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if params[:post_id]
      @comment.post_id = params[:post_id]
    else
      @comment.parent_comment_id = params[:comment_id]
      @comment.post_id = @comment.parent_comment.post_id
    end

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      if @comment.parent_comment
        flash[:errors] = @comment.errors.full_messages
        redirect_to comment_url(@comment.parent_comment)
      else
        flash.now[:errors] = @comment.errors.full_messages
        render :new
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
