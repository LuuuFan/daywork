class CatsController < ApplicationController

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: 422
    end
  end


  def edit
    @cat = Cat.find_by(id: params[:id])

      render :edit
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      render plain: "Cannot find cat"
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat
      if @cat.save
        redirect_to cat_url(@cat)
      else
        render json: @cat.errors.full_messages, status: 422
      end
    else
      render plain: "Cannot find cat"
    end
  end

  def index
    @cats = Cat.all
    render :index
  end


  def destroy
    @cat = Cat.find_by(id: params[:id])
    if @cat
      @cat.destroy
      redirect_to cats_url
    else
      render plain: "Cannot find cat"
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
  end

end
