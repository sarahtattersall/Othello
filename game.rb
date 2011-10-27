require './board.rb'
require './player.rb'

class Game
  def initialize
    @board = Board.new
    @board.display_board
    @players = [Player.new(Player::BLACK),
                Player.new(Player::WHITE)]
    place_initial_pieces
  end
  
  def place_initial_pieces
    top_right = @board.size/2
    @board.place_piece(top_right, top_right, @players[0])
    @board.place_piece(top_right, top_right - 1, @players[1])
    @board.place_piece(top_right - 1, top_right, @players[1])
    @board.place_piece(top_right - 1, top_right - 1, @players[0])
  end
end