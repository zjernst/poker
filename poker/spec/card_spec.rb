require 'card'
require 'rspec'

describe Card do
  subject(:card5) { Card.new(5)}
  subject(:card25) { Card.new(25)}
  subject(:card32) { Card.new(32)}
  subject(:card39) {Card.new(39)}

  describe "#suit" do
    it "knows its suit" do
      expect(card5.suit).to eq(:spades)
      expect(card25.suit).to eq(:hearts)
      expect(card32.suit).to eq(:diamonds)
      expect(card39.suit).to eq(:clubs)
    end
  end

  describe "#value" do
    it "knows its value" do
      expect(card5.value).to eq(6)
      expect(card25.value).to eq(:king)
      expect(card32.value).to eq(7)
      expect(card39.value).to eq(:ace)
    end
  end
end
