class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("JOIN test_passings ON test_passings.test_id = tests.id")
      .where('test_passings.user_id' => self.id, 'tests.level' => level)
  end
end
