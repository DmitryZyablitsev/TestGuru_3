class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new; end

  def create
    @question = Question.create!(question_params)
    redirect_to question_path(@question)
  end

  def index
    @questions = find_test.questions
    render inline: '<div> <% @questions.each { |q| %> <p> <%=q.body %> </p> <% } %>   </div>'
  end

  def show
    render inline: '<p> <%= @question.body %> </p>'
  end

  def destroy
    @question.destroy
    render test_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @questions = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
