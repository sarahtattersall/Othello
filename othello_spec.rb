require './game'

describe Game do

  let(:game) { Game.new }
  
  it "starts with correct board" do
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
    game.get_board.get_board.should == b
  end

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
    board = Board.new
    board.change_board(b)
    [p1,p2].map{ |p| p.can_move?(board) }.any?.should == false
  end
    
=begin
  it "allows players to place symbols using coordinates" do
    game.play_at(0,0, "X")
    game.show_board.should == "X__" + "___" + "___"
    game.play_at(1,1, "O")
    game.show_board.should == "X__" + "_O_" + "___"
  end

  it "prevents player playing in already filled place" do
    game.play_at(0,0, "X")
    game.play_at(0,0, "O")
    game.show_board.should == "X__" + "___" + "___"
  end
  
  it "detects a horizontal winning line" do
    game.play_at(0,0,"X")
    game.play_at(0,1,"X")
    game.has_been_won.should == false
    game.play_at(0,2,"X")
    game.has_been_won.should == true
  end

  it "detects a vertical winning line" do
    game.play_at(0,0,"O")
    game.play_at(1,0,"O")
    game.has_been_won.should == false
    game.play_at(2,0,"O")
    game.has_been_won.should == true
  end

  it "detects a forward diagonal winning line" do
    game.play_at(0,0,"O")
    game.play_at(1,1,"O")
    game.has_been_won.should == false
    game.play_at(2,2,"O")
    game.has_been_won.should == true
  end

  it "detects a reverse diagonal winning line" do
    game.play_at(0,2,"O")
    game.play_at(1,1,"O")
    game.has_been_won.should == false
    game.play_at(2,0,"O")
    game.has_been_won.should == true
  end
  
  it "allows the board size to be specified and checks rules appropriately" do
    small_game = TicTacToe.new(2)
    small_game.play_at(0,0,"O")
    small_game.has_been_won.should == false
    small_game.play_at(1,0,"O")
    small_game.has_been_won.should == true
  end

=end
end
