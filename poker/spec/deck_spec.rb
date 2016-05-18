require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}

  describe "#initialize" do
    it "starts with 52 cards" do
      expect(deck.cards.count).to eq(52)
    end

    it "has thirteen hearts" do
      hearts_count = 0
      deck.cards.each do |card|
        hearts_count += 1 if card.suit == :hearts
      end

      expect(hearts_count).to eq(13)
    end

    it "has four fives"
      fives_count = 0
      deck.cards.each do |card|
        fives_count += 1 if card.value == 5
      end

      expect(fives_count).to eq(5)
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      cards_array = deck.cards.dup
      expect(cards_array).to_not eq(deck.shuffle!)
    end

    it "shuffles the discard pile back into the deck"
      10.times { deck.discards << deck.cards.pop }
      deck.shuffle!
      expect(deck.cards.count).to eq(52)
  end
