class CheersController < ApplicationController
  before_action :set_cheer, only: [:show, :edit, :update, :destroy]
  before_action :require_current_user
  # GET /cheers
  # GET /cheers.json
  # def index
  #   @cheers = Cheer.all
  # end

  # GET /cheers/1
  # # GET /cheers/1.json
  # def show
  # end

  # GET /cheers/new
  # def new
  #   @cheer = Cheer.new
  # end

  # GET /cheers/1/edit
  # def edit
  # end

  # POST /cheers
  # POST /cheers.json
  def create
    @cheer = Cheer.new
    @cheer.user_id = current_user.id
    @cheer.goal_id = params[:goal_id]
    if @cheer.save
      flash[:notice] = "You cheered #{@cheer.goal.user.username}'s goal!"
      redirect_to user_url(@cheer.goal.user)
    else
      flash[:errors] = @cheer.errors.full_messages
      redirect_to user_url(@cheer.goal.user)
    end
  end

  # PATCH/PUT /cheers/1
  # PATCH/PUT /cheers/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheer
      @cheer = Cheer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def cheer_params
    #   params.require(:cheer).permit(:user_id, :goal_id)
    # end
end
