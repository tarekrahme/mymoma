class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.monetize :amount
      t.string :merchant
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
