class Player
  WHITE = 0
  BLACK = 1
  
  def initialize(c)
    @color = c
  end
  
  def can_move?(board)
    for i in (0..board.size)
      for j in (0..board.size)
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
    return @color
  end
end