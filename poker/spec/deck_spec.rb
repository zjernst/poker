require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}
  let(:dummy_card) {double(:card)}

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

    it "has four fives" do
      fives_count = 0
      deck.cards.each do |card|
        fives_count += 1 if card.value == 5
      end

      expect(fives_count).to eq(4)
    end

    it "starts with an empty discard pile" do
      expect(deck.discards).to eq([])
    end
  end

  describe "#shuffle!" do
    it "shuffles the deck" do
      cards_array = deck.cards.dup
      expect(cards_array).to_not eq(deck.shuffle!)
    end

    it "shuffles the discard pile back into the deck" do
      10.times { deck.discards << deck.cards.pop }
      deck.shuffle!
      expect(deck.cards.count).to eq(52)
    end

  end

  describe "#pull_card" do
    it "takes a card from the top of the deck" do
      top_card = deck.cards.last

      expect(deck.pull_card).to be(top_card)
    end

    it "removes a card from the deck" do
      deck.pull_card
      expect(deck.cards.count).to eq(51)
    end
  end

  describe "#discard_card" do
    it "adds a card to the discard pile" do
      deck.discard_card(dummy_card)
      expect(deck.discards.count).to eq(1)
    end
  end
end
