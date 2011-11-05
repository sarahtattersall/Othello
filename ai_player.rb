require "./player"
class AIPlayer < Player

    def get_move(board)
      for i in (0..(board.size-1))
        for j in (0..(board.size-1))
          return i, j if board.legal_move?(i, j, self)
        end
      end
    end
end

