class ActionsController < ApplicationController

  def index
    #TODO change this so that it's only the user's actions
    @actions = Action.all
  end

  def new
    @action = Action.new
  end

  def create
    @action = Action.create(action_params)
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
