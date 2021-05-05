class AddCompletedToStudy < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :completed, :integer
  end
end
