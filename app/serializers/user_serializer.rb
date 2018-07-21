class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :admin
  has_many :selections
  has_many :benefits, :through => :selections
end
