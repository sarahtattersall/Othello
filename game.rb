require './board.rb'
require './human_player.rb'

class Game
  def initialize
    @board = Board.new
    @players = [HumanPlayer.new(Player::BLACK),
      HumanPlayer.new(Player::WHITE)]
      place_initial_pieces
    end

    def play
      player = 1
      while @players.map{ |p| p.can_move?(@board) }.any?
        p = @players[player]
        @board.display_board
        if p.can_move?(@board)
          x, y = p.get_move(@board)
          @board.place_piece(x, y, p)
        else
          puts "No available moves for player #{p}, skipping go"
        end
        player = 1 - player
      end
    end
    
    def place_initial_pieces
      x = @board.size/2
      y = @board.size/2
      
      @board.place_piece(x, y, @players[0])
      @board.place_piece(x - 1, y, @players[1])
      @board.place_piece(x, y - 1, @players[1])
      @board.place_piece(x -1, y - 1, @players[0])
    end

    def get_board
      @board
    end
  end
