class SubsController < ApplicationController
  before_action :require_current_user, only: [:new, :edit, :create, :update]

  def new
    @sub = Sub.new

  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.friendly.find(params[:id])
  end

  def update
    @sub = Sub.friendly.find(params[:id])
    if is_moderator(@sub)
      if @sub.update(sub_params)
        redirect_to sub_url(@sub)
      else
        flash.now[:errors] = @sub.errors.full_messages
        render :edit
      end
    else
      flash[:notice] = ["You are not authorized to do that"]
      redirect_to sub_url(@sub)
    end

  end

  def show
    @sub = Sub.friendly.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  private

  def is_moderator?(sub)

    if sub.moderator_id == current_user.id
      true
    else
      false
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
