require './cell.rb'

class Board
  def initialize(size = 8)
    @size = size
    @board = Array.new(size) { Array.new(size, Cell.new)}
  end
  
  def size
    return @size
  end
  
  def get_cells
    return @board
  end
  
  def place_piece(x, y, p)
    puts "Placing piece for player #{p} at #{x},#{y}"
    @board[x][y] = Cell.new(p)
    display_board
    #TODO work out which pieces to flip
  end
  
  def legal_move?(x, y, p)
    #TODO
    return !@board[x][y].is_occupied?
  end
  
  def display_board
    (0..@size).each do |i|
      puts @board[i].inspect
    end
  end
end
