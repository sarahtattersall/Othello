require './cell.rb'

class Board
  # Initialises the board with dimensions size * size and fills it with cells 
  # which have no owner (blank)
  def initialize(size = 8)
    @size = size
    @cells = Array.new(size) { Array.new(size, Cell.new)}
  end
  
  # Replaces the cell at x,y with a new cell owned by player p. 
  # Then fcalls the function to to flip opponents pieces based on the 
  # new cell placement
  def place_piece(x, y, p)
    @cells[x][y] = Cell.new(p)
    flip_pieces(x, y, p)
  end
  
  # Flips pieces based on the cell at x,y and the current player
  def flip_pieces(x, y, p)
    pieces = []
    for i in [-1,0,1]
      for j in [-1,0,1]
        to_flip = get_flippable_pieces(x+i, y+j, i, j, p)
        if to_flip.length != 0
          for x,y in to_flip
            @cells[x][y].flip(p)
          end
        end
      end
    end
  end
  
  # Scans out in star formation to check all lines away from the placed cell 
  # for opponent pieces surrounded by current player's pieces
  def get_flippable_pieces(x, y, x_offset, y_offset, p)
    flip = []
    if in_bounds?(x, y)
      if @cells[x][y].is_occupied? and !@cells[x][y].owned_by?(p)
        while in_bounds?(x, y) && @cells[x][y].is_occupied?
          return flip if @cells[x][y].owned_by?(p)
          flip << [x,y]
          x += x_offset
          y += y_offset
        end  
      end
    end
    return []
  end
  
  # Check if move is legal. This is true if it isn't occupied and will result 
  # in some opponent pieces being flipped
  def legal_move?(x, y, p)
    return false if @cells[x][y].is_occupied?
    legal = false
    for i in [-1,0,1]
      for j in [-1,0,1]
        if !(i == 0 and j == 0)
          legal |= !get_flippable_pieces(x+i, y+j, i, j, p).empty?
        end
      end
    end
    return legal
  end
  
  def count_player_pieces(p)
    count = 0
    for i in (0..@size-1)
      for j in (0..@size-1)
        count += 1 if @cells[i][j].owned_by?(p)
      end
    end
    return count
  end
  
  # Outputs the board to the console (Simple Gui)
  def display_board
    print "   "
    (0..(@size-1)).map{ |i| print "#{i+1}" + ((i < @size - 1) ? ", " : " ")}
    print "\n"
    (0..(@size-1)).map { |i| puts "#{i+1} #{@cells[i].inspect}" }
  end
  
  def in_bounds?(x, y)
    return valid_row?(x) && valid_row?(y)
  end
  
  def valid_row?(x)
    return x >= 0 && x < @size
  end
  
  def valid_col?(y)
    return y >= 0 && y < @size
  end
  
  def get_size
    return @size
  end
end
