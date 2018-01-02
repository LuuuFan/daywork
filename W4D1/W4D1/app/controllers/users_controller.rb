class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
    # render plain: "I'm in the index action!"
  end

  def show
    user = User.find_by(id: params[:id])
    if user.nil?
      render plain: 'Cannot find the user'
    else
      render json: user
    end
  end

  def new

  end

  def create
    # render json: params
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      # render json: @user.errors.full_messages, status: :unprocessable_entity
      render json: @user.errors.full_messages, status: 422
    end
  end

  def edit
    render json: params
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      if user.update(user_params)
        redirect_to user_url(user)
      else
        render json: user.errors.full_messages, status: 422
      end
    else
      render plain: 'Cannot find the user'
    end
    # render json: params
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      redirect_to users_url
    else
      render plain: 'Cannot find user'
      # redirect_to users_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end

end
