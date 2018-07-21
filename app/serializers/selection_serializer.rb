class SelectionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :benefit_id, :beneficiaries
  belongs_to :user
  belongs_to :benefit
end
