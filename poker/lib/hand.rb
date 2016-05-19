class Hand

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    max_val = @cards.each_with_object([]) {|card, arr| arr << card.value}.max

    if flushes && straights
      return [8, max_val]
    elsif flushes
      return [5, max_val]
    elsif straights
      return [4, max_val]
    else
      return [0, max_val]
    end
  end

  def flushes
    flush = true
    suit = @cards.last.suit
    @cards.each do |card|
      flush = false unless card.suit == suit
    end
    flush
  end

  def straights
    straight = true
    values = []
    @cards.each do |card|
      card_value = card.id % 13
      card_value += 13 if card_value == 0
      values << card_value
    end

    unless (values.max - values.min == 4) && (values.uniq.count == values.count)
      straight = false
    end

    straight
  end
end
