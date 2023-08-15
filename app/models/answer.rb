class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_correct_number_of_responses, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_correct_number_of_responses
    errors.add(:base) if question.answers.count >=4
  end
end
