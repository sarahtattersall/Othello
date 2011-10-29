require './board'
require './player'

describe Board do
  let(:board) { Board.new }
  
  it "no more possible moves" do
    p1 = Player.new(Player::BLACK)
    p2 = Player.new(Player::WHITE)
    b = []
    b << Array.new(8, Cell.new(p2))
    b << Array.new(8, Cell.new(p2))
    b << Array.new(8, Cell.new(p2))
    b << [Cell.new(p2)]*7 + [Cell.new]
    b << [Cell.new(p2)]*6 + [Cell.new]*2
    b << [Cell.new(p2)]*7 + [Cell.new] + [Cell.new(p1)]
    b << [Cell.new(p2)]*7 + [Cell.new]
    b << Array.new(8, Cell.new(p2))
    board.change_board(b)
    [p1,p2].map{ |p| p.can_move?(board) }.any?.should == false
  end

  it "can't place with no pieces to flip" do
    p1 = Player.new(Player::BLACK)
    p2 = Player.new(Player::WHITE)
    b = []
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    b << [Cell.new]*3 + [Cell.new(p2)] + [Cell.new(Player.new(p1))] + [Cell.new]*3
    b << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new(p2)] + [Cell.new]*3
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    board.change_board(b)
    board.legal_move?(0,0,p1).should == false
    board.legal_move?(2,4,p1).should == false
  end
end
