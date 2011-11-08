require './board.rb'
require './human_player.rb'
require './ai_player.rb'

class Game
    def initialize
      @board = Board.new
      @players = []
      count = get_number_human_players
   
      @players << HumanPlayer.new(Player::BLACK)
      second_player_type = (count == 1) ? AIPlayer : HumanPlayer
      @players << second_player_type.new(Player::WHITE)
      place_initial_pieces
      @board.testcells(@players[0], @players[1])
    end
    
    def valid_number_human_players(count)
      return !(count < 1 || count > 2)
    end
    
    def get_number_human_players
      begin
          puts "Please enter the number of human players you wish to play (1 or 2)"
          count = (gets).to_i
          if !valid_number_human_players(count)
              puts "Not a valid input. Please try again"
              next
          end
      end while !valid_number_human_players(count)
      return count
    end
    
    def play
      player = 0
      while players_can_move
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
      
      # Neither player can move
      if draw?
        puts "No more moves, It's a draw!"
      else
        p1score = @board.count_player_pieces(@players[0])
        p2score = @board.count_player_pieces(@players[1])
        winscore = p1score > p2score ? p1score : p2score
        losescore = p1score > p2score ? p2score : p1score
        puts "No more moves, Player #{get_winner} won #{winscore}-#{losescore}!"
      end
    end
    
    def players_can_move
      return @players.map{ |p| p.can_move?(@board) }.any?
    end
    
    def draw?
      return @board.count_player_pieces(@players[0]) == @board.count_player_pieces(@players[1])
    end
    
    def get_winner
      if @board.count_player_pieces(@players[0]) > @board.count_player_pieces(@players[1])
        return @players[0]
      end
      return @players[1]
    end
    
    # Places the initial pieces in the center of the board
    def place_initial_pieces
      x = @board.get_size/2
      y = @board.get_size/2
      
      @board.place_piece(x, y, @players[0])
      @board.place_piece(x - 1, y, @players[1])
      @board.place_piece(x, y - 1, @players[1])
      @board.place_piece(x -1, y - 1, @players[0])
    end
  end
