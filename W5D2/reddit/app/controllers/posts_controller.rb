class PostsController < ApplicationController
  before_action :require_current_user, except:[:show, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @posts = Sub.find_by(id: params[:sub_id]).posts
  end

  def show
    @post = Post.friendly.find(params[:id])
    @comment = Comment.new
    @all_comments = @post.comments_by_parent_id
  end

  def edit
    @post = Post.friendly.find(params[:id])

  end

  def update
    @post = Post.friendly.find(params[:id])

    if is_author?
      if @post.update(post_params)
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end

    else
      flash[:notice] = ["You are not authorized to do that"]
      redirect_to post_url(@post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def is_author?
    current_user.id == @post.author_id
  end
end
