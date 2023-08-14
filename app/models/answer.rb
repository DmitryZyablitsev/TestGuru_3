class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_correct_number_of_responses

  scope :correct, -> { where(correct: true) }

  def validate_correct_number_of_responses
    errors.add(:base) if question.answers.count > 3
  end
end
