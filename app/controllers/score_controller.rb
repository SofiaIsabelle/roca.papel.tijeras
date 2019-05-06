
class ScoreController < ApplicationController
  include RockPaperScissors

 
  def index
    @scores = RockPaperScissors::Game.instance.score.reverse
  end
end
