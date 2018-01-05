class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    # @cat = Cat.find_by(id: params[:id])
    @cat = Cat.includes(rental_requests:[:user]).where(id: params[:id])[0]
    # @requests = CatRentalRequest.find_by(cat_id: params[:id])
    #.includes(:user)
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def is_owner?
    @cat = Cat.where(user_id: current_user.id).find_by(id: params[:id])
    if @cat.nil?
      redirect_to cats_url
    else
      @cat
    end
  end

  before_action :is_owner?, only: [:edit, :update]

  def edit
    # @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
