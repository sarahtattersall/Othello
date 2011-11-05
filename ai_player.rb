require "./player"
class AIPlayer < Player

    def get_move(board)
      for i in (0..(board.size-1))
        for j in (0..(board.size-1))
           if board.legal_move?(i, j, self)
             puts "Computer played #{i+1}, #{j+1}"
             return i, j
           end
        end
      end
    end
end

