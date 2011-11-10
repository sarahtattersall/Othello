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
    @owner = p
    return self
  end

  def is_occupied?
    return @owner != nil
  end
  
  def owned_by?(p)
    return @owner == p
  end
  
  def set_owner(p)
    @owner = p
    return self
  end
end
