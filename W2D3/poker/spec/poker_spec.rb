require 'poker'
require 'rspec'

RSpec.describe Card do
  subject(:card) { Card.new(3, 'spades') }
  describe '#initialize' do

    it 'initializes value instance variable' do
      expect(card.value).to eq(3)
    end
    it 'initializes suit instance variable' do
      expect(card.suit).to eq('spades')
    end
  end














end
