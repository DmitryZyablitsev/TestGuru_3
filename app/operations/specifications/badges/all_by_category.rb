module Specifications
  module Badges
    class AllByCategory < Specifications::AbstractRuleSpecification

      def initialize(value:, test_passage:, badge_title:)    
        super        
        @user = @test_passage.user
      end

      def satisfies?
        if @test_passage.successful && every_test_is_passed && xxx
          true
        end
      end

      def every_test_is_passed
        @all_test_ids_by_category = Test.list_by_category(@value).pluck(:id)
        @passed_tests_by_category = @user.successfully_completed_tests(@all_test_ids_by_category)

        #если size seta пройденных тестов равен setу всех тестов этой категории будем считать сколько раз прошли каждый тест
        @passed_tests_by_category.order(:test_id).pluck(:test_id).to_set.size == @all_test_ids_by_category.to_set.size
      end

      def xxx ##################################################### назови метод или разбей на несколько
        number_of_completed_tests(@all_test_ids_by_category, @passed_tests_by_category).min > @user.badges_by_title(@badge_title).count
      end

      def number_of_completed_tests(array_id_all_tests, list_passed_tests)
        number_of_test_passes = []
        array_id_all_tests.each do |id_test|
          number_of_test_passes << list_passed_tests.where(test_id: id_test).count
        end
        number_of_test_passes
      end

    end
  end
end
