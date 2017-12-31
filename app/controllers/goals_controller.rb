class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  helper_method :most_completed_tasks

  def most_completed_tasks
    @user = current_user
    @user.most_completed_tasks
  end

  def index
    #TODO change this so that it's only the user's goals
    @goals = current_user.goals.incomplete
  end

  def garden
    @goals = current_user.goals.complete
  end

  def new
    @goal = Goal.new
    @goal.categories.build
    @goal.goal_categories.build
    @goal.tasks.build(name: "Task 1")
    @goal.tasks.build(name: "Task 2")
    @goal.tasks.build(name: "Task 3")
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:notice] = "Goal successfully created!"
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def show
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
      flash[:notice] = "Goal successfully updated!"
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  def destroy
    if current_user == @goal.user
      @goal.destroy
      flash[:notice] = "Goal successfully deleted!"
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :status, :start_date, :end_date, category_ids:[], categories_attributes:[:name], goal_categories_attributes:[:subcategory, :category_id], tasks_attributes:[:name, :description])
  end

end
