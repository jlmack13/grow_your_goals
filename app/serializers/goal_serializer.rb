class GoalSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :start_date, :end_date,:completed_date
  has_many :tasks
  belongs_to :user
end
