
module RockPaperScissors
  
  RULES = {
    rock: { beats: [:scissors] },
    paper: { beats: [:rock] },
    scissors: { beats: [:paper] }
  }.freeze

  
  def valid_rule?(rule)
    RULES.key?(rule.to_sym)
  end

  
  def random_rule
    RULES.keys.sample
  end
end