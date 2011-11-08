class Player
  WHITE = 0
  BLACK = 1
  
  def initialize(c)
    @color = c
    @count = 0
  end
  
  def can_move?(board)
    for i in (0..(board.get_size-1))
      for j in (0..(board.get_size-1))
        return true if board.legal_move?(i, j, self)
      end
    end
    return false
  end
  
  def inspect
    return @color
  end
  
  def symbol
    return (@color == WHITE)? "O" : "X"
  end
  
  def to_s
    return symbol
  end
end
