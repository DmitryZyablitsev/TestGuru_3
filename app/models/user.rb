class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passings, dependent: :destroy
  has_many :tests, through: :test_passings
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: 'author_id',
           dependent: :destroy,
           inverse_of: :author
  has_many :gists,
           class_name: 'Gist',
           foreign_key: 'author_id'
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges


  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def tests_passing(test)
    test_passings.order(id: :desc).find_by(test_id: test.id, passing_status: 'in_progress')
  end

  def tests_passed(test)
    test_passings.where(test_id: test.id, passing_status: 'passed')
  end

  def successfully_completed_tests(tests)
    test_passings.where(passing_status: 'passed', result: 85..100, test_id: tests)
  end

  def badges_by_title(title)
    badges.where(title: title)
  end

  def count_badges(title_badge)
    badges.where(title: title_badge).count
  end

  def admin? 
    type == 'Admin'
  end
end
