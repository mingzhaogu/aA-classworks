require 'first_tdd'
require 'rspec'

describe Array do
  subject(:array) { Array.new }
  arr = [1, 2, 1, 3, 3]

  describe '#my_uniq' do
    it 'returns the unique elements in the order' do
      expect(arr.my_uniq).to eq([1, 2, 3])
    end

    it 'returns new array' do
      expect(arr.my_uniq).to_not be(arr)
    end

    it 'does not call the Array#uniq method' do
      expect(arr).to_not receive(:uniq)
    end
  end

  describe '#two_sum' do
    it 'finds all pairs of positions where the elements
      at those positions sum to zero' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'sorts smaller index before bigger index' do
      expect([-1, 0, 2, -2, 1].two_sum).to_not include([4, 0])
    end
  end
end

describe '#my_transpose' do

  let(:small_start) do
    [[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]]
  end

  let(:small_finish) do
    [[0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]]
  end

  let(:big_start) do
    [[0, 3, 6, 10, 11],
    [1, 4, 7, 12, 13],
    [2, 5, 8, 9, 14],
    [199, 15, 18, 19, 44],
    [22, 25, 28, 29, 54]]
  end

  let(:big_end) do
    [[0, 1, 2, 199, 22],
    [3, 4, 5, 15, 25],
    [6, 7, 8, 18, 28],
    [10, 12, 9, 19, 29],
    [11, 13, 14, 44, 54]]
  end

  it 'converts between the row-oriented and
    column-oriented representations' do
    expect(my_transpose(small_start)).to eq(small_finish)
  end

  it 'converts large arrays' do
    expect(my_transpose(big_start)).to eq(big_end)
  end

  it 'returns [] when no elements are given' do
    expect(my_transpose([[]])).to eq([])
  end
end

describe '#stock_picker' do
  it 'outputs the most profitable pair of days' do
    expect(stock_picker([12, 145, 4, 134])).to eq([0,1])
  end

  it 'return empty array if there is not profitable pair of days' do
    expect(stock_picker([5, 4, 3, 2, 1])).to eq([])
  end
end

describe 'TowersOfHanoi' do
  subject(:game) { TowersOfHanoi.new }
  subject(:won_game) { TowersOfHanoi.new }

  describe '#valid_move?' do
    it 'should raise error if from_stack has length == 0' do
      expect { game.valid_move?(1, 0) }.to raise_error("No disc exists")
    end

    it 'should raise error if disc is smaller than
      the last element in to_stack' do
      allow(game).to receive(:stack).and_return([[3, 2], [1], []])
      expect { game.valid_move?(0, 1) }.to raise_error("Disc too big!")
    end

    it 'should only take the last element of the array' do

    end

    it 'should raise error if from_tower or to_tower does not exist' do
      expect { game.valid_move?(0, 5) }.to raise_error("Only enter 0 to 2.")
      expect { game.valid_move?(5, 0) }.to raise_error("Only enter 0 to 2.")
    end

  end

  describe '#move' do
    it 'should move disc from one pile to another' do
      allow(game).to receive(:stack).and_return([[3, 2, 1], [], []])
      puts game.stack
      expect(game.move(0, 1)).to eq([[3, 2], [1], []])
    end
  end

  describe '#won?' do
    it 'returns true when all discs are either in tower 1 or 2' do
      allow(won_game).to receive(:stack).and_return([[], [3, 2, 1], []])
      expect(won_game).to be_won
    end

    it 'return false when not all discs are either in tower 1 or 2' do
      game.stack = [[3], [ 2, 1], []]
      expect(game).to_not be_won
    end
  end
end
