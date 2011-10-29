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
    pieces = []
    for i in [-1,0,1]
      for j in [-1,0,1]
        to_flip = flip_pieces(x+i, y+j, i, j, p)
        if to_flip.length != 0
          for x,y in to_flip
            @board[x][y].flip(p)
          end
        end
      end 
    #display_board
    end
  end
  
  def legal_move?(x, y, p)
    return false if @board[x][y].is_occupied?
    legal = false
    for i in [-1,0,1]
      for j in [-1,0,1]
        if !(i == 0 and j == 0)
          legal |= find_piece(x+i, y+j, i, j, p)
        end
      end
    end 
    #[-1,0,1].each{ |i| [-1, 0, -1].each{ |j| legal |= find_piece(x+i, y+j, i, j, p)} }
    return legal
  end
  
  def display_board
    puts "   0, 1, 2, 3, 4, 5, 6, 7"
    (0..(@size-1)).each do |i|
      puts "#{i} #{@board[i].inspect}"
    end
  end

  def flip_pieces(x, y, x_offset, y_offset, p)
    flip = []

	if (x >= 0 and y >= 0 and x < @size and y < @size)
		if @board[x][y].is_occupied? and !@board[x][y].owned_by?(p)
		  while( x >= 0 and y >= 0 and x < @size and y < @size )
			return flip if @board[x][y].owned_by?(p)
            flip << [x,y]
			x += x_offset
			y += y_offset
		  end  
		end
	end
	return []
  end
  
  

  def find_piece(x, y, x_offset, y_offset, p)
    #puts "#{x}, #{y}, #{x_offset}, #{y_offset}"
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

  def place_initial_pieces
    top_right = @board.size/2
    @board.place_piece(top_right, top_right, @players[0])
    @board.place_piece(top_right, top_right - 1, @players[1])
    @board.place_piece(top_right - 1, top_right, @players[1])
    @board.place_piece(top_right - 1, top_right - 1, @players[0])
  end


  
  def get_board
    @board
  end

  # For testing purposes only
  def change_board( board )
    @board = board
  end
    

end
