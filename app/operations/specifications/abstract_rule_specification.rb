module Specifications
  class AbstractRuleSpecification
    def initialize(value:, test_passage:, badge_title:)
      @value = value
      @test_passage = test_passage
      @badge_title = badge_title
    end
    #удовлетворяет?
    def satisfies?
      raise "#{__method__} undefined for #{self.class}"
    end
  end
end
