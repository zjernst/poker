require_relative 'card'

class Deck

  attr_reader :cards, :discards

  def initialize
    @cards = []
    @discards = []
    setup
  end

  def setup
    (0..51).each do |num|
      @cards << Card.new(num)
    end
  end

  def shuffle!
    @cards.concat(@discards)
    @cards.shuffle!
  end

  def pull_card
    @cards.pop
  end

  def discard_card(card)
    @discards << card
  end

end
