class Card
  attr_reader :id, :suit, :value

  SUITS = {0 => :spades, 1 => :hearts, 2 => :diamonds, 3 => :clubs}
  VALUES = {0 => :ace, 12 => :king, 11 => :queen, 10 => :jack}
  def initialize(id)
    @id = id
    @suit = SUITS[id / 13]
    @value = get_value
  end

  def get_value
    starting_id = @id % 13
    if starting_id.between?(1, 9)
      @id = starting_id + 1
    else
      @value = VALUES[starting_id]
    end
  end

end
