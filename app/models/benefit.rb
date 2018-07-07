class Benefit < ApplicationRecord
  has_many :selections
  has_many :users, :through => :selections

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :link, presence: true
  validates :flat_cost, presence: true
  validates :flat_cost, numericality: { only_integer: true }
  validates :percent_cost, presence: true
  validates :percent_cost, numericality: { only_integer: true }

end
