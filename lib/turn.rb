class Turn
attr_reader :guess, :card
  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    # check guess against card.answer
    @guess == @card.answer
  end

  def feedback
    # check if correct
    # return corresponding feedback
    if correct?
      "Correct!"
    else
      "Incorrect!"
    end

  end
end
