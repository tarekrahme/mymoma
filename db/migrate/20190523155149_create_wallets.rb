class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.monetize :daily_income
      t.monetize :savings
      t.monetize :fixed_cost
      t.monetize :current_balance

      t.timestamps
    end
  end
end
