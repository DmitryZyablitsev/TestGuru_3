class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true, length: { in: 2..50 },
                    uniqueness: { case_sensitive: false }
  validates :image_url, presence: true, uniqueness: true
  validates :description, presence: true

  def received?(user)
    !!UserBadge.find_by(badge: self, user: user)
  end
end
