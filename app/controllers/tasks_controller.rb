class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.incomplete
  end

  def new
    @task = Task.new(goal_id: params[:goal_id])
  end

  def create
    @goal = Goal.find_by_id(params[:task][:goal_id])
    @task = @goal.tasks.build(task_params)
    if @task.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user == @task.goal.user
      render :edit
    else
      redirect_to '/'
    end
  end

  def update
    @goal = Goal.find_by_id(params[:task][:goal_id])
    if @task.update(task_params)
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  #add notices about deleted task
  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find_by_id(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :goal_id)
  end
end
