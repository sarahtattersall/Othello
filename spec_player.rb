require './spec_helper'


describe Player, "on creation" do
  let(:p1) { Player.new(Player::WHITE) }
  let(:p2) { Player.new(Player::BLACK) }

  it "should set the color correctly" do
    p1.color = Player::WHITE
    p2.color = Player::BLACK
  end

  it "should return 1/0 on inspect corresponding to black/white" do
    p1.inspect.should == 0
    p2.inspect.should == 1
  end

  it "should return the correct symbol (X - black, O - white)" do
    p1.symbol.should == "O"
    p2.symbol.should == "X"
  end

  it "should return symbol if represented as a string" do
    "#{p1}".should == "O"
    "#{p2}".should == "X"
  end
end

describe Player, "during gameplay" do
  let(:p1) { Player.new(Player::WHITE) }
  let(:p2) { Player.new(Player::BLACK) }
  let(:board) { Board.new }

  before (:each) do
    cs = []
    2.times { cs << [Cell.new]*8 }
    cs << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new]*4
    cs << [Cell.new]*3 + [Cell.new(p1)]*2 + [Cell.new]*3
    cs << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new(p2)] + [Cell.new]*3
    3.times { cs << [Cell.new]*8 }
    board.cells = cs
  end

  it "should recognise that they can play a move on the board" do
    p1.can_move?(board).should == true
    p2.can_move?(board).should == true
  end
end

describe Player, "at the end of the game" do
  let(:p1) { Player.new(Player::WHITE) }
  let(:p2) { Player.new(Player::BLACK) }
  let(:board) { Board.new }

  before (:each) do
    cs = []
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*8
    cs << [Cell.new(p1)]*7 + [Cell.new]
    cs << [Cell.new(p1)]*6 + [Cell.new]*2
    cs << [Cell.new(p1)]*7 + [Cell.new] + [Cell.new(p2)]
    cs << [Cell.new(p1)]*7 + [Cell.new]
    cs << [Cell.new(p1)]*8
    board.cells = cs
  end

  it "should recognise that they cannot play a move on the board" do
    p1.can_move?(board).should == false
    p2.can_move?(board).should == false
  end
end
