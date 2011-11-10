require './game' # => consequent classes

class Game
  attr_accessor :board, :players
  
  def get_number_human_players
    return 2
  end
  
  def get_board_size
    return 8 # standard size
  end
end

class Board
  attr_accessor :cells, :size
  
  def change_board( cells )
    @cells = cells
  end
end

class Player
  attr_accessor :color, :count
end

class Cell
  attr_accessor :owner
end