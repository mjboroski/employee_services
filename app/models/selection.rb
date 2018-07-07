class Selection < ActiveRecord::Base
  belongs_to :user
  belongs_to :benefit

  validates :beneficiaries, presence: true
  validates :beneficiaries, numericality: { only_integer: true }
  validates :beneficiaries, presence: true, if: :not_negative?

  def not_negative?
    beneficiaries >= 0
  end

  def sign_up
    "Thanks for enrolling in #{self.benefit.name}!"
  end

end
