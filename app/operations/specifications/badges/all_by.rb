module Specifications
  module Badges
    class AllBy < Specifications::AbstractRuleSpecification

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
