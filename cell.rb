class Cell
  @owner

  def initialize(p = nil)
    @owner = p
  end

  def inspect
    case @owner
    when nil
      return " "
    else
      return @owner.symbol
    end
  end

  def flip(p)
    @owner.decrement_count
    @owner = p
    @owner.increment_count
  end

  def is_occupied?
    return @owner != nil
  end
  
  def owned_by?(p)
    return @owner == p
  end
  
  def set_value(v)
    @owner = v
  end
end
