require './board.rb'
require './player.rb'

class Game
  def initialize
    @board = Board.new
    @players = [Player.new(Player::BLACK),
      Player.new(Player::WHITE)]
      place_initial_pieces
    end

    def play
      player = 1
      while @players.map{ |p| p.can_move?(@board) }.any?
        p = @players[player]
        
        @board.display_board
        
        if p.can_move?(@board)
          x, y = get_move
          while !@board.legal_move?(x, y, p)
            puts "Invalid move, please try again"
            x, y = get_move
          end
          @board.place_piece(x, y, p)
        else
          puts "No available moves for player #{p}, skipping go"
        end
        player = 1 - player
      end
    end

    def get_move
      #TODO - Add error checking

      puts "Please enter you move:"
      puts "row: "
      x = (gets).to_i
      puts "col: "
      y = (gets).to_i
      return x-1, y-1
    end

    def place_initial_pieces
      top_right = @board.size/2
      @board.place_piece(top_right, top_right, @players[0])
      @board.place_piece(top_right, top_right - 1, @players[1])
      @board.place_piece(top_right - 1, top_right, @players[1])
      @board.place_piece(top_right - 1, top_right - 1, @players[0])
    end

    def get_board
      @board
    end
  end
