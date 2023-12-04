class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  def received?(user)
    !!UserBadge.find_by(badge: self, user: user)
  end
end
