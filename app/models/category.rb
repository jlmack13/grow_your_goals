class Category < ApplicationRecord
  has_many :goal_categories
  has_many :goals, through: :goal_categories

  validates_uniqueness_of :name
  validates_presence_of :name
end
