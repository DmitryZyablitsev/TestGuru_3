class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all 
  end

  def start   
    @test = Test.find(params[:id])
    unless current_user.tests_passing(@test)
      current_user.tests.push(@test)
    end
    redirect_to current_user.tests_passing(@test)
  end
end
