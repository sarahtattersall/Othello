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
    
    # Returns -1, -1 if input is invalid which ensures failure later 
    # tests in the code
=begin
    def get_move(p)
      #TODO - Add error checking
      error_message = "Invalid move, please try again"
      puts "Player #{p}, please enter your move:"
      begin
        
        puts "row: "
        x = (gets).to_i
        if x == 0 || !@board.valid_row?(x)
          puts error_message
          next
        end

        puts "col: "
        y = (gets).to_i
        if y == 0 || !@board.valid_col?(y)
          puts error_message
          next
        end
        break if @board.legal_move?(x - 1 ,y - 1, p)
        puts error_message
      end while true
      puts "Valid #{x}, #{y}"
      
      return x - 1, y -1
    end
=end
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
