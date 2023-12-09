module Specifications
  module Badges
    class AllByLevel < Specifications::AbstractRuleSpecification
      def initialize(value:, test_passage:, badge_title:)    
        super        
        @user = @test_passage.user
      end

      def satisfies?
        if @test_passage.successful && all_by_level(@value, @badge_title )
          true
        end
      end

      def all_by_level(level, name_badge)
        @all_tests_id_by_level = Test.list_by_level(level).pluck(:id)
        @passed_tests_by_level = @user.successfully_completed_tests(@all_tests_id_by_level)
      
        if @passed_tests_by_level.order(:test_id).pluck(:test_id).to_set.size == @all_tests_id_by_level.to_set.size
          if number_of_completed_tests(@all_tests_id_by_level, @passed_tests_by_level).min > @user.count_badges(name_badge)
           true
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
  end
end
