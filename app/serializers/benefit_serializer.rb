class BenefitSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :link, :flat_cost, :percent_cost

  has_many :selections
  has_many :users, :through => :selections
end
