require './game'

class Game
  def get_board
    @board
  end
end

describe Board do
  let(:game) { Game.new }
  
  it "game starts with correct board in 8x8 game" do
    p1 = Player.new(Player::WHITE)
    p2 = Player.new(Player::BLACK)
    b = []
    
    # Expected Board
    3.times {b << Array.new(8, Cell.new)}
    b << [Cell.new]*3 + [Cell.new(p2)] + [Cell.new(p1)] + [Cell.new]*3
    b << [Cell.new]*3 + [Cell.new(p1)] + [Cell.new(p2)] + [Cell.new]*3
    3.times {b << Array.new(8, Cell.new)}

    board = Board.new
    game.get_board.display_board.should == board.display_board
  end
end
