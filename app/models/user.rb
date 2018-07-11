class User < ActiveRecord::Base
  has_secure_password

  has_many :selections
  has_many :benefits, :through => :selections

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:name => auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end
end
