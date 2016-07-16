class Api::V1::GoalsController < Api::V1::BaseController
  def index
    goals = Goal.order(:id)

    render(json: goals)
  end

  def show
    goal = Goal.find(params[:id])

    render(json: goal)
  end
end