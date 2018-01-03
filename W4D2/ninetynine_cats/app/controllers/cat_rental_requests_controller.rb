class CatRentalRequestsController < ApplicationController

  def new
    @cats_name = Cat.select(:name, :id)
  end

  def create

  end
end
