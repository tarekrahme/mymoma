class AddMonthlyContributionToGoals < ActiveRecord::Migration[5.2]
  def change
     add_monetize :goals, :monthly_contribution, currency: { present: false}
  end
end
