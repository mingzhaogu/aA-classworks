class Card
  SUITS = {
    spades: ♠️,
    hearts: ♥️,
    clubs: ♣️,
    diamonds: ♦️
  }

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

end
