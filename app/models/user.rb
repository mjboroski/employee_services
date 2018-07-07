class User < ActiveRecord::Base
  has_secure_password

  has_many :selections
  has_many :benefits, :through => :selections

  validates :name, presence: true
  validates :name, uniqueness: true

end
