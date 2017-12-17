class ActionsController < ApplicationController

  def index
    #TODO change this so that it's only the user's actions
    @actions = current_user.actions.all
  end

  def new
    @action = Action.new
  end

  def create
    @goal = Goal.find_by(params[:goal_id])
    @action = @goal.actions.build(action_params)
    if @action.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @action.update(action_params)
  end

  def destroy
  end

  private

  def action_params
    params.require(:action).permit(:name, :description)
  end
end
