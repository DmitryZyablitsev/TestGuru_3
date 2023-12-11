module Specifications
  module Badges
    class SuccessfulFirstAttempt < Specifications::AbstractRuleSpecification

      def initialize(value:, test_passage:, badge_title:)    
        super
        @user = @test_passage.user
        @test = @test_passage.test
      end

      def satisfies?
        if @test_passage.successful          
          @user.tests_passed(@test).count == 1
        end
      end
    end
  end
end
