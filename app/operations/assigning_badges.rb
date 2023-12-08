class AssigningBadges
  def initialize(user, test)
    @user = user
    @test = test
  end

  def call
    list_metods_assing_badges = Badge.all.order(:id).pluck(:rule, :argument)    
    list_metods_assing_badges.map! { |el| send(el.first, el.last.delete(' ').split(',').first, el.last.delete(' ').split(',').last) }
  end

  def self.rules
    {
      'За успешное прохождение всех тестов определённой категории' => 'all_by_category',
      'За успешное прохождение всех тестов определённого уровня' => 'all_by_level',
      'За успешное прохождение теста с первой попытки' => 'first_try'
    }
  end

  private
  def first_try(*args)
    if @user.tests_passed(@test).count == 1
      @user.user_badges.create!(badge: Badge.find_by(title: ('First')))
    end
  end

  # Выдать бэйдж после успешного прохождения всех тестов из определённой категории
  def all_by_category(category, name_badge)
    all_test_ids_by_category = Test.list_by_category(category).pluck(:id)
    passed_tests_by_category = @user.successfully_completed_tests(all_test_ids_by_category)

    #если size seta пройденных тестов равен setу всех тестов этой категории будем считать сколько раз прошли каждый тест
    if passed_tests_by_category.order(:test_id).pluck(:test_id).to_set.size == all_test_ids_by_category.to_set.size
      if number_of_completed_tests(all_test_ids_by_category, passed_tests_by_category).min > @user.badges_by_title(name_badge).count
        @user.user_badges.create!( badge: Badge.find_by(title:name_badge))
      end
    end
  end

  # Выдать бэйдж после успешного прохождения всех тестов определённого уровня
  def all_by_level(level, name_badge)
    all_tests_id_by_level = Test.list_by_level(level).pluck(:id)
    passed_tests_by_level = @user.successfully_completed_tests(all_tests_id_by_level)

    if passed_tests_by_level.order(:test_id).pluck(:test_id).to_set.size == all_tests_id_by_level.to_set.size
      if number_of_completed_tests(all_tests_id_by_level, passed_tests_by_level).min > @user.count_badges(name_badge)
        @user.user_badges.create!( badge: Badge.find_by(title:name_badge))
      end
    end
  end

  def number_of_completed_tests(array_id_all_tests, list_passed_tests)
    number_of_test_passes = []
    array_id_all_tests.each do |id_test|
      number_of_test_passes << list_passed_tests.where(test_id: id_test).count
    end
    number_of_test_passes
  end
end
