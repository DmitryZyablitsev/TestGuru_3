class QuestionsController < ApplicationController
  before_action :current_question, only: %i[show destroy]
  before_action :current_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
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
    params.require(:question).permit(:body)
  end

  def current_question
    @question = Question.find(params[:id])
  end

  def current_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
