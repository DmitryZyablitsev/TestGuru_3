class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :test_id, presence: true, numericality: { only_integer: true }
end
