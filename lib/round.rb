require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.shift
  end

  def take_turn(guess)
    Turn.new(guess, @current_card)
  end
end
