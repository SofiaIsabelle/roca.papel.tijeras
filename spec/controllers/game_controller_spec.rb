# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GameController, type: :controller do
  render_views

  describe 'homepage' do
    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'offers two game modes to choose from' do
      get :index
      assert_select 'div.card', 2
    end
  end

  describe 'watch' do
    it 'renders result template' do
      get :watch
      expect(response).to render_template(:result)
    end
  end

  describe 'play' do
    it 'renders play template' do
      get :play
      expect(response).to render_template(:play)
    end
  end

  describe 'cheating' do
    it 'should raise a CheatingError' do
      expect {
        get :result, params: { shape: 'unknown' }
      }.to raise_error(RockPaperScissors::Errors::CheatingError)
    end
  end
end

RSpec.feature 'GameFeatures', :type => :feature do
  scenario 'user clicks on Watch button' do
    visit '/'
    click_link 'Watch'
    expect(page).to have_text('Bot 1 vs Bot 2')
  end

  scenario 'user clicks on Play button' do
    visit '/'
    click_link 'Play'
    expect(page).to have_text('Player vs Bot')
  end
end
