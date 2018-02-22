class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :start_date, :end_date,:completed_date
  belongs_to :goal
end
