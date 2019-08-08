require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_has_attributes
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
    assert_equal @card1, @round.current_card
  end

  def test_it_takes_a_turn
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
    assert new_turn.correct?
    expected = [new_turn]
    assert_equal expected, @round.turns
    assert_equal @card2, @round.current_card
  end

  def test_it_counts_correct_answers
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_it_counts_turns
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_it_returns_feedback
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal "Incorrect!", @round.turns.last.feedback
  end

  def test_it_does_not_count_incorrect
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_it_counts_correct_in_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_it_counts_correct_in_other_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_gives_percentage_of_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
  end

  def test_it_gives_percent_correct_in_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end
end
