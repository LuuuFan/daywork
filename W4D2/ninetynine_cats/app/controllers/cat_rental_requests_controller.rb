class CatRentalRequestsController < ApplicationController

  def new
    @cats_name = Cat.select(:name, :id)
  end

  def create
    @request = CatRentalRequest.new(request_params)
    if @request.save
      redirect_to cats_url
    else
      render json: @request.errors.full_messages
    end
  end

  def approve
    current_request.approve!
    redirect_to cat_url(current_request.cat)
  end

  def deny
    current_request.deny!
    redirect_to cat_url(current_request.cat)
  end

  private

  def current_request
    @request ||= CatRentalRequest.includes(:cat).find_by(id: params[:id])
  end

  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

end
