class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def show
    @days_elapsed = ((Time.now - @goal.created_at) / 864000)
    @months_elapsed = @days_elapsed / 30
    @amount_saved = @months_elapsed * @goal.monthly_contribution
    @progress = @goal.progress

  end

  def new
    @goal = Goal.new
    @wallet = current_user.wallet
  end

  def create
    @goal = Goal.new(goal_params)
    @wallet = current_user.wallet
    @goal.wallet = @wallet
    @goal.monthly_contribution = @goal.amount / (@goal.completion_date.month - Date.today.month)
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @goal = Goal.update(goal_params)
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :amount, :buffer, :picture, :link, :completion_date)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

end
