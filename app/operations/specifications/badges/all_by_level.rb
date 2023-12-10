module Specifications
  module Badges
    class AllByLevel < Specifications::Badges::AllBy
      
      def initialize(value:, test_passage:, badge_title:)
        super
        @user = @test_passage.user
      end

      def satisfies?
        @test_passage.successful && every_test_is_passed? && passed_enough_tests?
      end

      private

      def every_test_is_passed?
        @all_tests_id_by_level = Test.list_by_level(@value).pluck(:id)
        @passed_tests_by_level = @user.successfully_completed_tests(@all_tests_id_by_level)      
        @passed_tests_by_level.order(:test_id).pluck(:test_id).to_set.size == @all_tests_id_by_level.to_set.size
      end

      def passed_enough_tests?
        number_of_completed_tests(@all_tests_id_by_level, @passed_tests_by_level).min > @user.count_badges(@badge_title)
      end

    end
  end
end
