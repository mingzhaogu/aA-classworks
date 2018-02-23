class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    hand_value = 0

    cards.each do |card|
      if card.value == :ace && hand_value > 10
        hand_value += 1
      elsif card.value == :ace
        hand_value += 11
      else
        hand_value += card.blackjack_value
      end
    end

    hand_value
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1) unless points >= 21
  end

  def beats?(other_hand)
    return true if other_hand.busted?
    return false if points <= other_hand.points
    return false if self.busted?
    true
  end

  def return_cards(deck)
    deck.return(cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
