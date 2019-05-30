class DaysController < ApplicationController
  before_action :set_day, only: [:show]
  def index
    # @days = Day.all
    @days = ((Date.today - 6.days)..Date.today).to_a
    @days.map!(&:wday)
    transactions = Transaction.joins(:day).where(days: { date: ((Date.today - 6.days)..Date.today).to_a }, wallet: current_user.wallet)
    @results = {}
    transactions.each do |transaction|
      transaction_day_of_week = transaction.day.date.wday
      if @results.key?(transaction_day_of_week)
        @results[transaction_day_of_week] += transaction.amount_cents / 100
      else
        @results[transaction_day_of_week] = transaction.amount_cents / 100
      end
    end
  end

  def show

  end

  private

  def set_day
    @day = Day.find(params[:id])
  end
end
