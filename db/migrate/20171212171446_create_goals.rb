class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :category
      t.belongs_to :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.date :completed_date

      t.timestamps
    end
  end
end
