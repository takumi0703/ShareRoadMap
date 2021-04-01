class RenameGoalToRoad < ActiveRecord::Migration[6.1]
  def change
    rename_table :goals, :roads
  end
end
