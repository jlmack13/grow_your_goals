class Category < ApplicationRecord
  has_many :goal_categories
  has_many :goals, through: :goal_categories

  validates_uniqueness_of :name
  validates :name, length: {maximum: 20}

end
