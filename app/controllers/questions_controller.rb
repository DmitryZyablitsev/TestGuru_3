class QuestionsController < ApplicationController
  before_action :current_question, only: %i[show edit update destroy]
  before_action :current_test, only: %i[index new create]
  skip_before_action :verify_authenticity_token
  def index
    @questions = @test.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def show    
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
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
