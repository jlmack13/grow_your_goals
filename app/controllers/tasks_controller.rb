class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks
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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :goal_id)
  end
end
