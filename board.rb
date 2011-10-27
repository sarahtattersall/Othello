require './cell.rb'
require './player.rb'

class Board
  def initialize(size = 8)
    @size = size
    @board = Array.new(size) { Array.new(size, Cell.new)}
    
  end
  
  def size
    return @size
  end
  
  def place_piece(x, y, p)
    @board[x][y] = Cell.new(p)
    #TODO work out which pieces to flip
  end
  
  def legal_move?(x, y)
    #TODO
    return true
  end
  
  def display_board
    (0..@size).each do |i|
      puts @board[i].inspect
    end
  end
end
