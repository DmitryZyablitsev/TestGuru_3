class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_passings,
           class_name: 'TestPassing',
           foreign_key: 'current_question_id',
           dependent: :destroy,
           inverse_of: :current_question

  validates :body, presence: true  
end
