class Test < ApplicationRecord
  def self.category(category)
    Test.joins("JOIN categories ON tests.category_id = categories.id").where('categories.title'=> category)
  end
end
