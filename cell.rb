class Cell
  @owner

  def initialize(p = nil)
    @owner = p
  end

  def inspect
    case p
    when nil
      return " "
    else
      return "X"
    end
  end

  def flip
    if @value == EMPTY
      raise "Error trying to flip a cell without a piece on"
    end
    if @value == WHITE
      @value = BLACK
    else
      @value == WHITE
    end
  end

  def is_occupied
    return @value != EMPTY
  end

  def set_value(v)
    @value = v
  end
end