class TestPassing < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions_counter += 1      
    end
    save! 
  end

  def number_questions
    test.questions.count
  end

  def remaining_questions
   questions = self.test.questions.order(:id).where('id > ?', self.current_question.id)
   if questions.empty?
    complete
   end
   questions
  end

  def question_number
    number_questions - remaining_questions.count
  end

  def result_passage
    success_rate  = correct_questions_counter.to_f / number_questions * 100
  end

  private

  def before_validation_set_next_question
    self.current_question = 
      if self.new_record?
        test.questions.first
      else
        remaining_questions.first
      end

  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort    
  end

  def correct_answers
    current_question.answers.correct
  end

  def complete
    self.passed = true
    self.result = result_passage
    # 85..100 это результат прохождения теста который считается успешным
    self.successful = true if result_passage >= 85
  end
end
