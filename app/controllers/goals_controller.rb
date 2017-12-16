class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create(goal_params)
    redirect_to goal_path(@goal)
  end

  def show
    @actions = @goal.actions
  end

  def edit
  end

  def update
    @goal.update(goal_params)
    redirect_to goal_path(@goal)
  end

  def destroy
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :category, :start_date, :end_date)
  end

end
