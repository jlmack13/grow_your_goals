class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:show, :edit, :update]

  def index
    #TODO change this so that it's only the user's goals
    @goals = current_user.goals
  end

  def garden
    @goals = current_user.goals.completed
  end

  def new
    @goal = Goal.new
    @goal.categories.build
    3.times { @goal.tasks.build }
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def show
    #TODO only allow user to view their own goals
    if current_user == @goal.user
      @tasks = @goal.tasks
    else
      redirect_to '/'
    end
  end

  def edit
    if current_user == @goal.user
      @tasks = @goal.tasks
    else
      redirect_to '/'
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  #add notice about goal being deleted
  def destroy
    @goal.destroy
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :status, :start_date, :end_date, category_ids:[], categories_attributes:[:name], tasks_attributes:[:name])
  end

end
