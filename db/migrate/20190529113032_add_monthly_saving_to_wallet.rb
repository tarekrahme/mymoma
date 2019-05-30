class AddMonthlySavingToWallet < ActiveRecord::Migration[5.2]
  def change
    add_monetize :wallets, :monthly_saving, currency: { present: false}
  end

end
