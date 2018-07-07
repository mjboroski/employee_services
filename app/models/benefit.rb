class Benefit < ApplicationRecord
  has_many :selections
  has_many :users, :through => :selections

end
