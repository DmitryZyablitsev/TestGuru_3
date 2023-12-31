class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passings, dependent: :destroy
  has_many :users, through: :test_passings

  validates :title, presence: true, length: { maximum: 255 },
                    uniqueness: { scope: :level, message: 'such a pair of title and level exists' }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }  

  scope :easy_level, -> { where(level: 0..1) }
  scope :average_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  def self.list_by_category(category_name)
    joins(:category)
      .where(category: { title: category_name })
      .order(:id)
  end

  def self.list_by_level(level)
    where(level: level).order(:id)
  end

  def self.available_levels
    all.order(:level).pluck(:level)
  end
end
