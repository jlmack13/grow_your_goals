class Task < ApplicationRecord
  belongs_to :goal
  validates_presence_of :name

  #scope methods
  scope :complete, -> {where(status: 'Complete')}
  scope :incomplete, -> {where.not(status: 'Complete')}

end
