class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  class << self
    def assign(user, test)
      @@user = user
      # тот тест оторый завершил пользователь
      @@test = test 
      conditions()
    end

    private

    def conditions()
      first_try()
      all_by_category('География')
    end

    def first_try()
      tests_list = @@user.tests_passed(@@test)
      if tests_list.count == 1
        tests_list.first.user.user_badges.create!( badge: find_badge('Pawn') )
      end
    end
    
    # Выдать бэйдж после успешного прохождения всех тестов из категории География
    def all_by_category(category)

      #выбрать все существующие тесты по определённой категории в виде массива их id-шников
      all_tests_id_by_category = Test.joins(:category)
            .where(category: { title: category })
            .order(:id)
            .pluck(:id)
      
      passed_tests_by_category = TestPassing.where(user: @@user, passing_status: 'passed', test_id: all_tests_id_by_category)
      

      #если массив пройденных тестов равен массиву всех тестов этой категории будем считать сколько раз прошли каждый тест
      if passed_tests_by_category.order(:test_id).pluck(:test_id) == all_tests_id_by_category # в целях оптимизации возмижно стоит сравнивать длинны этих массивов
        number_of_test_passes = []
        all_tests_id_by_category.each do |id_test|
          passed_tests_by_category.where(test_id: id_test)
          number_of_test_passes << passed_tests_by_category.where(test_id: id_test).count
        end
        if number_of_test_passes.min > UserBadge.where(user: @@user, badge: 'Horse').count
          @@user.user_badges.create!( badge: Badge.find_by(title:'Horse'))
          
        end
      end
    end

    def find_badge(title)
      Badge.find_by(title: title)
    end

  end
  # rook
  # ROOK
  # horse
  # HORSE
  # pawn
  # PAWN
end
