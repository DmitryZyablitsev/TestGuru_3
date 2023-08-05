class User < ApplicationRecord
  def passed_tests(t_level)
    Test.joins("JOIN user_tests ON user_tests.test_id = tests.id").where('tests.level' => t_level)
  end
end
