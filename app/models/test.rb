class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :test_passings
  has_many :users, through: :test_passings

  def self.list_by_category(category_name)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title' => category_name)
      .order(title: :desc)
      .pluck(:title)
  end
end
