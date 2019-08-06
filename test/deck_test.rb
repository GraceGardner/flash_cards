require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    # create three instances of Card
    # put Cards in array
    # create instance of Deck with card as attribute
    # assert deck is an instance of Deck
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end

  def test_deck_has_cards
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Array, deck.cards
    assert_equal card1, deck.cards[0]
    assert_equal card3, deck.cards[2]
  end

  def test_number_of_cards_in_deck
    # skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 3, deck.count
  end

  def test_can_filter_by_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expected = [card2, card3]

    actual = deck.cards_in_category(:STEM)

    assert_equal expected, actual
  end

  def test_can_filter_by_other
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expected = [card1]

    actual = deck.cards_in_category(:Geography)

    assert_equal expected, actual
  end

  def test_category_does_not_exist
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    expected = []

    actual = deck.cards_in_category("Pop Culture")

    assert_equal expected, actual
  end


end
