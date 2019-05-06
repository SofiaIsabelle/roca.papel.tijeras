class GameController < ApplicationController
  include RockPaperScissors

  def index; end

  def play; end

  def result
    @title = 'You vs Curb'
    @again_link = play_path
    @p1 = validate_params(params)
    @p2 = random_rule

    if game.draw?(subject: @p1, opponent: @p2)
      game.add_score_draw
      return @result = 'Draw'
    end

    @result =
      if game.can_beat?(subject: @p1, opponent: @p2)
        game.add_score_victory
        'You won'
      else
        game.add_score_defeat
        'Curb won'
      end
  end

  private

  # Memorized variable
  def game
    @_game ||= RockPaperScissors::Game.instance
  end

  # Validates request data against registered shapes
  def validate_params(params)
    return params[:shape].to_sym if valid_rule? params[:shape].to_sym
    raise RockPaperScissors::Errors::CheatingError.new(shape: params[:shape])
  end
end
