class Array

  def remove_dups
    no_dupes = []
    self.each{|el| no_dupes << el unless no_dupes.include?(el)}
    no_dupes
  end

  def two_sum
    indices = []
    each_with_index do |el1, idx1|
      each_with_index do |el2, idx2|
        indices << [idx1, idx2] if (el1 + el2 == 0) && (idx2 > idx1)
      end
    end
    indices
  end

  def my_transpose
    # return nil unless [0].is_a?(Array)
    result = []
    self[0].each_index do |idx1|
      row = []
      each_index do |idx2|
        row << self[idx2][idx1]
      end
      result << row
    end

    result
  end
end

def stock_picker(array)
  profit = 0
  lowest = array.first
  lowest_day = 0
  days = [0, nil]

  array.each_with_index do |el, idx|

    lowest, lowest_day = el, idx if el < lowest

    temp_profit = el - lowest

    if temp_profit > profit
      profit = temp_profit
      days = [lowest_day, idx]
    end
  end

  days[-1].nil? ? nil : days
end

class TowersOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def move(take, give)
    return false if towers[take].empty?

    if towers[give].empty? || towers[take].last < towers[give].last
      towers[give] << towers[take].pop
    else
      false
    end
  end

  def won?
    @towers == [[],[3,2,1],[]] || @towers == [[],[],[3,2,1]]
  end
end
