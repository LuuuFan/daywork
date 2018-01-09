class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :require_current_user

  # GET /comments
  # # GET /comments.json
  def index
    if params[:user_id]
      @comments = User.find_by(id: params[:user_id]).comments
    elsif params[:goal_id]
      @comments = User.find_by(id: params[:goal_id]).comments
    end
    render :index
  end

  # GET /comments/1
  # GET /comments/1.json
  # def show
  # end

  # GET /comments/new
  # def new
  #   @comment = Comment.new  # end

  # GET /comments/1/edit
  # def edit
  # end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id] if params[:user_id]
    @comment.goal_id = params[:goal_id] if params[:goal_id]
    if @comment.save
      flash[:notice] = "Comment Saved"
      if params[:user_id]
        redirect_to user_url(@comment.user)
      else
        redirect_to goal_url(@comment.goal)
      end
    else
      flash[:errors] = @comment.errors.full_messages
      if params[:user_id]
        redirect_to user_url(@comment.user)
      else
        redirect_to goal_url(@comment.goal)
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json

  # DELETE /comments/1
  # DELETE /comments/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
