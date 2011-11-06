require './board.rb'
require './human_player.rb'
require './ai_player.rb'

class Game
    def initialize
      @board = Board.new
      @players = []
      begin
          puts "Please enter the number of human players you wish to play (1 or 2)"
          count = (gets).to_i
          if count == 0 || count > 2
              puts "Not a valid input. Please try again"
              next
          end
      end while count == 0 || count > 2
   
      @players << HumanPlayer.new(Player::BLACK)
      if count == 1:
          @players << AIPlayer.new(Player::WHITE)
      else
          @players << HumanPlayer.new(Player::WHITE)
      end
      place_initial_pieces
    end

    def play
      player = 0
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
      if draw?
        puts "No more moves! It's a draw!"
      else
        puts "No more moves! Player #{get_winner} won!"
      end
    end
    
    def draw?
      return @players[0].get_count == @players[1].get_count
    end
    
    def get_winner
      if @players[0].get_count > @players[1].get_count
        return @players[0]
      end
      return @players[1]
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
