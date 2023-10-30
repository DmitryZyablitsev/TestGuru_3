class TestPassingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passing, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passing.accept!(params[:answer_ids])
    if @test_passing.completed?
      TestsMailer.completed_test(@test_passing).deliver_now
      redirect_to result_test_passing_path(@test_passing)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passing.current_question).call
  
    if result.success?
      Gist.create(url: result.html_url, question: @test_passing.current_question, author: current_user)
      
      flash[:notice] = t('.success', link: view_context.link_to('Gist', result.html_url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end
  
    redirect_to @test_passing
  end

  private

  def set_test_passing
    @test_passing = TestPassing.find(params[:id])
  end
end
