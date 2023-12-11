module Specifications
  module Badges
    class BadgeDepartament
      def initialize(test_passage)
        @test_passage = test_passage
      end

      def self.rules
       {
        'За успешное прохождение всех тестов определённой категории' => 'AllByCategory',
        'За успешное прохождение всех тестов определённого уровня' => 'AllByLevel',
        'За успешное прохождение теста с первой попытки' => 'SuccessfulFirstAttempt'
       }.freeze
      end

      RULES = {
        'AllByCategory' => Badges::AllByCategory,
        'AllByLevel' => Badges::AllByLevel,
        'SuccessfulFirstAttempt' => Badges::SuccessfulFirstAttempt
      }.freeze

      def call
        Badge.find_each do |badge|
          rule = RULES[badge.rule_type].new(value: badge.rule_value, test_passage: @test_passage, badge_title: badge.title)
          add_badges(badge) if rule.satisfies?
        end
      end

      private

      def add_badges(badge)
        @test_passage.user.badges << badge
      end

    end
  end
end
