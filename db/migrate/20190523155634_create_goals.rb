class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.monetize :amount
      t.monetize :buffer
      t.string :picture
      t.string :link
      t.date :completion_date
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
