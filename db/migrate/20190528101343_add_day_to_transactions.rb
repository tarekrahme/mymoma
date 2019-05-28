class AddDayToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :day, foreign_key: true
  end
end
