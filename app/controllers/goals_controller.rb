class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @goal = Goal.new
    @wallet = Wallet.find(params[:wallet_id])
  end

  def create
    @goal = Goal.new(goal_params)
    @wallet = Wallet.find(params[:wallet_id])
    @goal.wallet = @wallet
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
