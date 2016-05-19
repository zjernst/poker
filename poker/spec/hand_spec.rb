require 'hand'
require 'rspec'

describe Hand do
  subject(:hand) {Hand.new(0)}
  let(:card1) { double(:id => 6,:value => 7, :suit => :spades)}
  let(:card2) { double(:id => 7,:value => 8, :suit => :spades)}
  let(:card3) { double(:id => 5,:value => 6, :suit => :spades)}
  let(:card4) { double(:id => 4,:value => 5, :suit => :spades)}
  let(:card5) { double(:id => 3,:value => 4, :suit => :spades)}

  describe "#evaluate" do
    it "evaluates a straight correctly" do
      cards_in_hand = [card1, card2, card3, card4, card5]
      sample_hand = Hand.new(cards_in_hand)

      expect(sample_hand.evaluate).to eq([8,8])
    end
  end
end
