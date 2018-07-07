class User < ActiveRecord::Base

  has_many :selections
  has_many :benefits, :through => :selections

end
