class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :status, :default => 'Incomplete'
      t.belongs_to :goal, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.date :completed_date

      t.timestamps
    end
  end
end
