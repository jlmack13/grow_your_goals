class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :goals
end
