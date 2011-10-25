class Cell
	class CellValue
		EMPTY = 1
		WHITE = 2
		BLACK = 3
	end
	@value = CellValue::EMPTY
	
	def flip
		if @value == CellValue::EMPTY
			raise "Error trying to flip a cell without a piece on"
		end
		if @value == CellValue::WHITE
			@value = CellValue::BLACK
		else
			@value == CellValue::WHITE
		end
	end
end
