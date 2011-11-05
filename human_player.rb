require "./player"
class HumanPlayer < Player
    def get_move( board)
      error_message = "Invalid move, please try again"
      puts "Player #{self}, please enter your move:"
      begin
        
        puts "row: "
        x = (gets).to_i
        if x == 0 || !board.valid_row?(x)
          puts error_message
          next
        end

        puts "col: "
        y = (gets).to_i
        if y == 0 || !board.valid_col?(y)
          puts error_message
          next
        end
        break if board.legal_move?(x - 1 ,y - 1, self)
        puts error_message
      end while true
      return x - 1, y -1
    end

end

