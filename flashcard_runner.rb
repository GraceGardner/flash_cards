require './lib/card'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is 5 + 5?", "10", :Math)
card2 = Card.new("What is Rachel's favorite animal?", "Dog", :People)
card3 = Card.new("What is Mike's middle name?", "nobody knows", :People)
card4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :People)
cards = [card1, card2, card3, card4]
deck = Deck.new(cards)
round = Round.new(deck)

round.start


# Create some Cards
# Put those card into a Deck
# Create a new Round using the Deck you created
# Start the round using a new method called start
