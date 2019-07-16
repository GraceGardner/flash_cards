require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    # create a new instance of Card
    # create a new instance of Turn and pass it card
    # assert turn instance exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    # create a new instance of Card
    # create a new instance of Turn and pass it card
    # assert it has a guess
    # assert it has a card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
    assert_equal card, turn.card
    assert_instance_of Card, turn.card
  end

  def test_it_is_correct
    # create a new instance of a Card
    # creat a new instance of Turn with a correct guess and pass it a card
    # assert it has a correct guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert turn.correct?
  end

  def test_it_is_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Spam", card)
    refute turn.correct?
  end

  def test_it_has_feedback
    # create a new instance of a Card
    # creat a new instance of Turn with a correct guess and pass it a card
    # assert it has a correct guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert turn.correct?
    assert_equal "Correct!", turn.feedback
  end

  def test_it_has_incorrect_feedback
    # create a new instance of a Card
    # creat a new instance of Turn with a correct guess and pass it a card
    # assert it has a incorrect guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Ham", card)
    refute turn.correct?
    assert_equal "Incorrect!", turn.feedback
  end

end
