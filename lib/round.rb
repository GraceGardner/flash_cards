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

  def start
    puts "Welcome! You're playing with #{get_total} cards."
    puts  "-------------------------------------------------"
    run_turn
  end

  def run_turn
    card_number = get_card_number
    total = get_total
    puts  "This is card number #{card_number} out of #{total}."
    puts  "Question: #{@current_card.question}"
    guess = gets.chomp
    turn = take_turn(guess)
    puts turn.feedback
    if card_number == total
      game_over_man
    else
      run_turn
    end
  end

  def game_over_man
    categories = get_categories
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{turns.count} for a total score of #{percent_correct}%."
    categories.each do |category|
      puts "#{category.to_s} - #{percent_correct_by_category(category)}% correct"
    end
  end

private

def get_total
  deck.cards.count + turns.count + 1
end

def get_card_number
  turns.count + 1
end

def cards_in_category(category)
  @turns.find_all do |turn|
    turn.card.category == category
  end.count
end

def get_categories
  @turns.map do |turn|
    turn.card.category
  end.uniq
end
end
