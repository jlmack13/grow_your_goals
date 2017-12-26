class Category < ApplicationRecord
  has_many :goal_categories
  has_many :goals, through: :goal_categories

  validates_uniqueness_of :name
  #validates :name, length: {maximum: 20}

  def subcategory
    subcategory = "none"
    self.goal_categories.each do |goal_category|
      if goal_category.subcategory != "" && !goal_category.subcategory.nil?
        subcategory = goal_category.subcategory
      end
    end
    subcategory
  end

end
