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
          x, y = get_move(p)
          while !@board.legal_move?(x, y, p)
            puts "Invalid move, please try again"
            x, y = get_move(p)
          end
          @board.place_piece(x, y, p)
        else
          puts "No available moves for player #{p}, skipping go"
        end
        player = 1 - player
      end
    end
    
    # Returns -1, -1 if input is invalid which ensures failure later 
    # tests in the code
    def get_move(p)
      #TODO - Add error checking
      puts "Player #{p}, please enter your move:"
      
      puts "row: "
      x = (gets).to_i
      return -1, -1 if x == 0
      
      puts "col: "
      y = (gets).to_i
      return -1, -1 if y == 0
      
      return x - 1, y - 1
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
