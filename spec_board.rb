require './spec_helper'


describe Board, "on default creation" do
  let(:board) { Board.new } # Default 8x8 board
  
  it "size should be 8x8" do
    board.size.should == 8
  end
  
  it "size should be the same as the height of the board" do
    board.size.should == board.cells.length
  end

  it "size should be the same as the width of the board" do
    board.cells.map {|row| row.length == board.size}.all?.should == true
  end
end

describe Board, "on variable board size creation" do
  let(:board) { Board.new(20) } # Default 8x8 board

  it "size should be 20x20" do
    board.size.should == 20
  end

  it "size should be the same as the height of the board" do
    board.size.should == board.cells.length
  end

  it "size should be the same as the width of the board" do
    board.cells.map {|row| row.length == board.size}.all?.should == true
  end
end

describe Board, "during gameplay" do
  let(:board) { Board.new } # Default 8x8 board
  let(:p1) { Player.new(Player::BLACK) }
  let(:p2) { Player.new(Player::WHITE) }
  
  before (:each) do
    cs = []
    2.times { cs << [Cell.new]*8 }
    cs << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new]*4
    cs << [Cell.new]*3 + [Cell.new(p1)]*2 + [Cell.new]*3
    cs << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new(p2)] + [Cell.new]*3
    3.times { cs << [Cell.new]*8 }
  end
  
  it "can't place with no pieces to flip" do
    board.legal_move?(3,5,p1).should == false
    board.legal_move?(5,3,p1).should == false
  end

  it "flips horizontal pieces correctly" do
    board_t = board
    board.place_piece(4,2,p2)
    board_t.cells[4][2].owner = p2
    board.cells.should == board_t.cells
  end

  it "flips vertical pieces correctly" do
    board_t = board
    board.place_piece(2,4,p2)
    board_t.cells[2][4].owner = p2
    board.cells.should == board_t.cells
  end

  it "flips diagonal pieces correctly" do
    board_t = board
    board.place_piece(2,2,p2)
    board_t.cells[2][2].owner = p2
    board.cells.should == board_t.cells
  end
end
