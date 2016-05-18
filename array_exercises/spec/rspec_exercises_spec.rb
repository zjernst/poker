require 'rspec_exercises'
require 'rspec'

describe "Array#remove_dups" do
  it "removes duplicates" do
    expect([2,3,4,4,5].remove_dups).to eq([2,3,4,5])
  end

  it "does not call #uniq" do
    my_array = [3,4,5,5]
    expect(my_array).not_to receive(:uniq)
    my_array.remove_dups
  end

  it "works on empty array" do
    my_array = []
    expect(my_array.remove_dups).to eq([])
  end
end

describe "Array#two_sum" do
  it "returns an array of arrays" do
    my_array = [1, 2, 3, -2]
    expect(my_array.two_sum.first).to be_an(Array)
  end

  it "returns indices of numbers that sum to zero" do
    my_array = [1, 2, 3, -2]
    expect(my_array.two_sum).to eq([[1, 3]])
  end

  it "returns the indices in order 'dictionary-wise'" do
    my_array = [-1, 0, 2, -2, 1]
    expect(my_array.two_sum).to eq([[0, 4], [2, 3]])
  end

  it "works on empty array" do
    my_array = []
    expect(my_array.two_sum).to eq([])
  end
end

describe "Array#my_transpose" do
  it "does not call built in transpose method" do
    my_array = [[]]
    expect(my_array.my_transpose).not_to receive(:transpose)
    my_array.my_transpose
  end

  it "works on square matrix" do
    my_array = [[1,2,3],[4,5,6],[7,8,9]]
    expect(my_array.my_transpose).to eq([[1,4,7],[2,5,8],[3,6,9]])
  end

  it "works on rectangular array" do
    my_array = [[1,2],[3,4],[5,6]]
    expect(my_array.my_transpose).to eq([[1,3,5],[2,4,6]])
  end

  it "raises an error if called on not an array" do
    my_array = "an array"
    expect {my_array.my_transpose}.to raise_error
  end
end

describe "#stock_picker" do
  context "works with a two element array" do

    it "returns buy and sell days if they will turn a profit" do
      my_array = [3, 7]
      expect(stock_picker(my_array)).to eq([0, 1])
    end

    it "returns nil if it can't turn a profit" do
      my_array = [7, 3]
      expect(stock_picker(my_array)).to eq(nil)
    end
  end

  it "works with a longer range of days" do
    my_array = [4, 6, 2, 16, 8, 9]
    expect(stock_picker(my_array)).to eq([2, 3])
  end

  it "returns the first pair if there is a tie" do
    my_array = [0, 2, 0, 2]
    expect(stock_picker(my_array)).to eq([0, 1])
  end

  it "works with profit spikes" do
    my_array = [45,67,32,56,34,3,5]
    expect(stock_picker(my_array)).to eq([2,3])
  end
end

describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new}

  describe "#move" do
    it "allows you to move smaller disk onto bigger disk" do
      game.move(0,1)
      expect(game.towers).to eq([[3,2],[1],[]])
    end

    it "does not allow you to move a bigger disk onto a smaller disk" do
      game.move(0,1)
      expect(game.move(0,1)).to eq(false)
      expect(game.towers).to eq([[3,2],[1],[]])
    end
  end

  describe "#won?" do
    it "returns true if all but one piles are empty except the first" do
      game.towers = [[],[3,2,1],[]]
      expect(game.won?).to eq(true)

      game.towers = [[],[],[3,2,1]]
      expect(game.won?).to eq(true)
    end

    it "returns false if all but the start pile are empty" do
      expect(game.won?).to eq(false)
    end

    it "returns false if more than one pile has disks" do
      game.towers = [[3],[2],[1]]
      expect(game.won?).to eq(false)
    end
  end

  describe "#towers" do
    it "starts with the first tower full" do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end
  end

end
