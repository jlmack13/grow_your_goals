class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_categories
  has_many :categories, through: :goal_categories
  has_many :tasks

  #validation
  validates_presence_of :name, :start_date, :end_date
  #TODO add validation for dates

  #scope methods
  scope :completed, -> {where(status: 'Complete')}
  scope :in_progress, -> {where(status: 'In Progress')}


  #accepts_nested_attributes_for :categories, reject_if: :all_blank
  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute[:name] != "" && !category_attribute[:name].nil
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end

end
