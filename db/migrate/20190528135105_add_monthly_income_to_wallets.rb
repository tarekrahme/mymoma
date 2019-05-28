class AddMonthlyIncomeToWallets < ActiveRecord::Migration[5.2]
  def change
    add_monetize :wallets, :monthly_income, currency: { present: false}
  end
end
