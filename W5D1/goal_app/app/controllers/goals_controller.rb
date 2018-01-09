class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy, :complete, :uncomplete]
  before_action :require_current_user
  # GET /goals
  # GET /goals.json
  def index
    @user = User.find_by(id: params[:user_id])
    @goals = @user.goals
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  # def edit
  # end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    # debugger
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def complete
    @goal.completed = "1"
    if @goal.save
      flash[:notice] = 'Goal updated'
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to goal_url(@goal)
    end
  end

  def uncomplete
    @goal.completed = "0"
    if @goal.save
      flash[:notice] = 'Goal updated'
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to goal_url(@goal)
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  # def update
  #
  # end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
      @goal.destroy
      redirect_to user_url(@goal.user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:title, :details, :private, :completed)
    end
end
