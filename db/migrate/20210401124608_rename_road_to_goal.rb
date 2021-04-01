class RenameRoadToGoal < ActiveRecord::Migration[6.1]
  def change
    rename_table :roads, :goals
  end
end
