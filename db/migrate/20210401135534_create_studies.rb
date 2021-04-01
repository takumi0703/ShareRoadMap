class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.string :content
      t.string :material
      t.date :period

      t.timestamps
    end
  end
end
