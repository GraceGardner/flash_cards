require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards.shift
  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @current_card = deck.cards.shift
    @turns.push turn
    turn
  end

  def number_correct
    @turns.find_all do |turn|
      turn.correct?
    end.count
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.correct? && turn.card.category == category
    end.count
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    num_correct = number_correct_by_category(category)
    cards_cat = cards_in_category(category).to_f
    (num_correct / cards_cat) * 100
  end

  private

  def cards_in_category(category)
    @turns.find_all do |turn|
      turn.card.category == category
    end.count
  end
end
