class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :body, presence: true
  validates :question_id, presence: true, numericality: { only_integer: true}
  validate :correct_number_of_responses
  def correct_number_of_responses   
      errors.add(:question_id) if Answer.where(question_id: question_id.to_i).count > 4    
  end
end
