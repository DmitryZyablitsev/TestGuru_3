class User < ApplicationRecord
  has_many :test_passings
  has_many :tests, through: :test_passings
  has_many :tests, foreign_key: 'author_id'

  def tests_by_level(level)
    Test.joins('JOIN test_passings ON test_passings.test_id = tests.id')
        .where('test_passings.user_id' => id, 'tests.level' => level)
  end
end
