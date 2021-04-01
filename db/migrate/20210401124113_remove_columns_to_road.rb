class RemoveColumnsToRoad < ActiveRecord::Migration[6.1]
  def change
    remove_column :roads, :content, :string
    remove_column :roads, :material, :string
    remove_column :roads, :period, :date
    add_column :roads, :goal, :string
  end
end
