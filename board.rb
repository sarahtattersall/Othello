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
    puts @board[x][y].is_occupied?
    display_board
    #TODO work out which pieces to flip
  end
  
  def legal_move?(x, y, p)
    legal = false
    [-1,0,1].each{ |i| [-1, 0, -1].each{ |j| legal |= find_piece(x+i, y+j, i, j, p)} }
    return legal
  end
  
  def display_board
    (0..@size).each do |i|
      puts @board[i].inspect
    end
  end

  def find_piece(x, y, x_offset, y_offset, p)
	if (x >= 0 and y >= 0 and x < @size and y < @size)
		if @board[x][y].is_occupied? and !@board[x][y].owned_by?(p)
		  while( x >= 0 and y >= 0 and x < @size and y < @size )
			return true if @board[x][y].owned_by?(p)
			x += x_offset
			y += y_offset
		  end  
		end
	end
	return false
  end
  
end
