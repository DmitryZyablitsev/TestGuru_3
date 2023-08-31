class TestsController < ApplicationController
  before_action :set_test, only: %i[show start]

  def index
   @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user = User.first # в будущем исправь
    @user.tests.push(@test)
    redirect_to @user.tests_passing(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end


end
