class AddProgressToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :progress, :float, default: 0
  end
end
