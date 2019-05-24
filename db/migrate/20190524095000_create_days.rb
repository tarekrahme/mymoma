class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.datetime :date
      t.monetize :budget
      t.float :goal_progress
      t.references :goal, foreign_key: true
      t.references :wallet, foreign_key: true
      t.string :show
      t.string :index

      t.timestamps
    end
  end
end
