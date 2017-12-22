class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_categories
  has_many :categories, through: :goal_categories
  has_many :tasks, dependent: :delete_all

  #validation
  validates_presence_of :name, :start_date, :end_date
  validates :name, length: {maximum: 30}
  validate :date_in_future
  #TODO add validation for dates

  #scope methods
  scope :complete, -> {where(status: 'Complete')}
  scope :incomplete, -> {where.not(status: 'Complete')}
  scope :in_progress, -> {where(status: 'In Progress')}


  #accepts_nested_attributes_for :categories, reject_if: :all_blank
  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute[:name] != "" && !category_attribute[:name].nil?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end

  #progress method
  def progress
    total = self.tasks.count
    current = self.tasks.complete.count
    progress = current / total .to_f
    percent = progress * 100
    percent
  end

  #plant_image method
  def plant_image
    if self.tasks.empty?
      if self.status == "Incomplete"
        "stage-1"
      elsif self.status == "In Progress"
        "stage-3"
      elsif self.status == "Complete"
        "stage-5"
      end
    else
      if self.progress.between?(0,25)
        "stage-1"
      elsif self.progress.between?(26,50)
        "stage-2"
      elsif self.progress.between?(51,75)
        "stage-3"
      elsif self.progress.between?(75,99)
        "stage-4"
      else
        "stage-5"
      end
    end
  end

  #validate date
  def date_in_future
    if !self.end_date.future?
      errors.add(:end_date, "Date must be in the future.")
    end
  end

end
