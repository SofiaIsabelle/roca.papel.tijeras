# frozen_string_literal: true

RSpec.describe RockPaperScissors do
  describe '#duels' do
    it 'paper beats rock' do
      expect(RockPaperScissors::Game.instance.can_beat?(subject: :paper, opponent: :rock)).to eq(true)
    end

    it 'rock beats scissors' do
      expect(RockPaperScissors::Game.instance.can_beat?(subject: :rock, opponent: :scissors)).to eq(true)
    end

    it 'scissors beats paper' do
      expect(RockPaperScissors::Game.instance.can_beat?(subject: :scissors, opponent: :paper)).to eq(true)
    end
  end

  describe '#draws' do
    it 'paper draws paper' do
      expect(RockPaperScissors::Game.instance.draw?(subject: :paper, opponent: :paper)).to eq(true)
    end

    it 'scissors draws scissors' do
      expect(RockPaperScissors::Game.instance.draw?(subject: :scissors, opponent: :scissors)).to eq(true)
    end

    it 'rock draws rock' do
      expect(RockPaperScissors::Game.instance.draw?(subject: :rock, opponent: :rock)).to eq(true)
    end
  end

  describe '#score' do
    it 'should fail when wrong score given' do
      expect {
        RockPaperScissors::Game.instance.add_score_unknown
      }.to raise_error(NoMethodError)
      expect(RockPaperScissors::Game.instance.score.count).to eq(0)
    end

    it 'should update score ' do
      RockPaperScissors::Game.instance.add_score_victory
      RockPaperScissors::Game.instance.add_score_defeat
      RockPaperScissors::Game.instance.add_score_draw
      expect(RockPaperScissors::Game.instance.score.count).to eq(3)
    end
  end
end