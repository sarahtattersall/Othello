require 'cell.rb'

class Board
	@board = []
	for i in 0..64
		@board << ( Cell.new )
	end
end
