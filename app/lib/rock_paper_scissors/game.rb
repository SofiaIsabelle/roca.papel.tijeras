# frozen_string_literal: true

module RockPaperScissors
  # Game logic
  class Game
    include Singleton
    include RockPaperScissors

    attr_reader :score

    SCORES = %i[victory defeat draw].freeze

    def initialize
      @score = []
    end

  
    def can_beat?(subject:, opponent:)
      RULES[subject][:beats].include? opponent
    end

   
    def draw?(subject:, opponent:)
      subject == opponent
    end

   
    def method_missing(name, *args, &block)
      if name.to_s.start_with?('add_score_')
        score = name.to_s.split('add_score_').last.to_sym
        if SCORES.include?(score)
          @score << score
        else
          super
        end
      else
        super
      end
    end

    
    def respond_to_missing?(name, include_private = false)
      name.to_s.start_with?('add_score_') || super
    end
  end
end