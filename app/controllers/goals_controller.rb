class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = Goal.order(:id)
  end

  def show
  end

  def new
    @goal = Goal.new
    @importable_ids = Goal.importable_ids.sort
  end

  def edit
  end

  def create_with_github
    raise
  end

  def create
    if goal_id = params['goal']['id']
      @goal = Goal.create_from_github(goal_id)
    else
      @goal = Goal.new(goal_params)
    end

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goals_path, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:github_import, :tried, :up, :down)
    end
end
