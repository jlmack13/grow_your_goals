class CreateGoalCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_categories do |t|
      t.belongs_to :goal, index: true
      t.belongs_to :category, index: true
      t.string :subcategory
      t.timestamps
    end
  end
end
