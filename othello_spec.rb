require './game'

describe Board do
  let(:game) { Game.new }
  
  it "game starts with correct board" do
    p1 = Player.new(Player::WHITE)
    p2 = Player.new(Player::BLACK)
    b = []
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    b << [Cell.new]*3 + [Cell.new(p2)] + [Cell.new(p1)] + [Cell.new]*3
    b << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new(p2)] + [Cell.new]*3
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    b << Array.new(8, Cell.new)
    board = Board.new
    board.change_board(b)
    game.get_board.display_board.should == board.display_board
  end
end
