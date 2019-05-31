class DaysController < ApplicationController
  before_action :set_day, only: [:show, :recommendations]
  def index
    recommendations
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
    @weekend_spend = (@results[0] + @results[6]).to_f / 2
    @weekday_spend = (@results[1] + @results[2] + @results[3] + @results[4] + @results[5]).to_f / 5
  end

  def show

  end

   def recommendations
    @wallet = current_user.wallet
    @available_spend = @wallet.monthly_income_cents - @wallet.savings_cents - @wallet.fixed_cost_cents
    @available_spend_after_goal = @available_spend - (@wallet.goal&.monthly_contribution&.to_i || 0)
    month = Date.today.month
    year = Date.today.year
    start = Date.parse "1.#{month}.#{year}"
    next_start = Date.parse "1.#{month + 1}.#{year}"
    days_in_month = Time.days_in_month(Date.today.month, Date.today.year)
    number_weekdays = (start..next_start).count { |date| (1..5).include?(date.wday) }
    number_weekends = days_in_month - number_weekdays
    weekend_factor = 3.3
    weighted_days = number_weekdays + weekend_factor * number_weekends
    spend_per_weighted_days = @available_spend_after_goal / weighted_days
    @weekday_available = spend_per_weighted_days
    @weekend_available = spend_per_weighted_days * weekend_factor
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end
end
