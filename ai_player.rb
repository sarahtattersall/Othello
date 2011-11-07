require "./player"
class AIPlayer < Player
  
    def get_move(board)
      move_with_simple_intelligence(board)
    end
    
    # Goes through every cell in sequence until it finds a playable position
    def move_with_simple_intelligence(board)
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

