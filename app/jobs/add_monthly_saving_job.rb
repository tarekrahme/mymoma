# class AddMonthlySavingJob < ApplicationJob
#   queue_as :default

#   def perform(wallet)
#     @total_spent = 0.0
#     today_type = Date.today.wday.to_i
#     recommendations(wallet)
#     if today_type > 0 && today_type < 6
#       @daily_budget = @weekday_available.round(1)
#     else
#       @daily_budget = @weekend_available.round(1)
#     end
#     @transactions = Transaction.where(wallet: wallet).joins(:day).where(days: { date: Date.today })
#     @transactions.each do |transaction|
#       @total_spent += transaction.amount_cents / 100.0
#     end
#     @daily_remaining = @daily_budget - @total_spent
#     wallet.monthly_saving += @daily_remaining
#     wallet.save
#   end

#   def recommendations(wallet)
#     @available_spend = wallet.monthly_income_cents - wallet.savings_cents - wallet.fixed_cost_cents
#     # @available_spend_after_goal = @available_spend - wallet.goal.monthly_contribution.to_i
#     month = Date.today.month
#     year = Date.today.year
#     start = Date.parse "1.#{month}.#{year}"
#     next_start = Date.parse "1.#{month + 1}.#{year}"
#     days_in_month = Time.days_in_month(Date.today.month, Date.today.year)
#     number_weekdays = (start..next_start).count { |date| (1..5).include?(date.wday) }
#     number_weekends = days_in_month - number_weekdays
#     weekend_factor = 3.3
#     weighted_days = number_weekdays + weekend_factor * number_weekends
#     spend_per_weighted_days = @available_spend_after_goal / weighted_days
#     @weekday_available = spend_per_weighted_days
#     @weekend_available = spend_per_weighted_days * weekend_factor
#   end
# end
