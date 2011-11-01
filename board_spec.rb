require './board'
require './player'

describe Board do
  let(:board) { Board.new }
  
  p1 = Player.new(Player::BLACK)
  p2 = Player.new(Player::WHITE)
  
  it "no more possible moves" do
    b = []
    3.times {b << Array.new(8, Cell.new(p2))}
    b << [Cell.new(p2)]*7 + [Cell.new]
    b << [Cell.new(p2)]*6 + [Cell.new]*2
    b << [Cell.new(p2)]*7 + [Cell.new] + [Cell.new(p1)]
    b << [Cell.new(p2)]*7 + [Cell.new]
    b << Array.new(8, Cell.new(p2))
    
    board.change_board(b)
    [p1,p2].map{ |p| p.can_move?(board) }.any?.should == false
  end

  it "can't place with no pieces to flip" do
    
    b = []
    3.times {b << Array.new(8, Cell.new)}
    b << [Cell.new]*3 + [Cell.new(p2)] + [Cell.new(p1)] + [Cell.new]*3
    b << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new(p2)] + [Cell.new]*3
    3.times {b << Array.new(8, Cell.new)}
    
    board.change_board(b)
    board.legal_move?(0,0,p1).should == false
    board.legal_move?(2,4,p1).should == false
  end

  it "placing piece flips horizontal pieces correctly" do
    
    b = []
    b << [Cell.new] + [Cell.new(p2)]*6 + [Cell.new(p1)]
    7.times {b << [Cell.new]*8}
    
    board1 = Board.new
    board1.change_board(b)
    board1.place_piece(0,0,p1)
    b[0] = [Cell.new(p2)]*8
    board2 = Board.new
    board2.change_board(b)
    board1.display_board.should == board2.display_board
  end

  it "placing piece flips vertical pieces correctly" do
    
    b = []
    b << [Cell.new]*8
    7.times {b << [Cell.new(p2)] + [Cell.new]*7}
    
    board1 = Board.new
    board1.change_board(b)
    board1.place_piece(0,0,p1)

    b = []
    8.times {b << [Cell.new(p2)] + [Cell.new]*7}
    
    board2 = Board.new
    board2.change_board(b)
    board1.display_board.should == board2.display_board
  end

  it "placing piece flips diagonal pieces correctly" do
    
    b = []
    b << [Cell.new]*8
    b << [Cell.new] + [Cell.new(p2)] + [Cell.new]*6
    b << [Cell.new]*2 + [Cell.new(p2)] + [Cell.new]*5
    b << [Cell.new]*3 + [Cell.new(p2)] + [Cell.new]*4
    b << [Cell.new]*4 + [Cell.new(p2)] + [Cell.new]*3
    b << [Cell.new]*5 + [Cell.new(p2)] + [Cell.new]*2
    b << [Cell.new]*6 + [Cell.new(p2)] + [Cell.new]*1
    b << [Cell.new]*7 + [Cell.new(p1)]
    
    board1 = Board.new
    board1.change_board(b)
    board1.place_piece(0,0,p1)

    b = []
    b << [Cell.new(p1)] + [Cell.new]*7
    b << [Cell.new] + [Cell.new(p1)] + [Cell.new]*6
    b << [Cell.new]*2 + [Cell.new(p1)] + [Cell.new]*5
    b << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new]*4
    b << [Cell.new]*4 + [Cell.new(p1)] + [Cell.new]*3
    b << [Cell.new]*5 + [Cell.new(p1)] + [Cell.new]*2
    b << [Cell.new]*6 + [Cell.new(p1)] + [Cell.new]*1
    b << [Cell.new]*7 + [Cell.new(p1)]
    
    board2 = Board.new
    board2.change_board(b)
    board2.place_piece(0,0,p1)
    board1.display_board.should == board2.display_board
  end

end
