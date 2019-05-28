class DaysController < ApplicationController
  before_action :set_day, only: [:show]
  def index
    @days = Day.all
  end

  def show

  end

  private

  def set_day
    @day = Day.find(params[:id])
  end
end
