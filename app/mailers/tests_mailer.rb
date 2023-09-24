class TestsMailer < ApplicationMailer

  def completed_test(test_passing)
    @user = test_passing.user
    @test = test_passing.test

    mail to: @user.mail, subject: 'You just completed the TestGuru test!'
  end
end
