class PawnTrace
	$movementRule=[[-3,0], [-2,-2], [0,-3], [2,-2], [3,0], [2,2], [0,3], [-2,2]]
	def initialize(board_size)
		@board_size=board_size
		@move=0
		@board=Array.new(@board_size) {Array.new(@board_size,0)}
		@range=(0..@board_size-1).to_a
	end
	def start_pawn(row_cord,col_cord)
		@move+=1
		@board[row_cord][col_cord]=@move
		make_the_move(row_cord,col_cord)
	end
	def is_move_valid(new_row_cord, new_col_cord)
		return @range.include?(new_row_cord) && @range.include?(new_col_cord) && @board[new_row_cord][new_col_cord]==0
	end
	def make_the_move(row_cord,col_cord)
		if @move==(@board_size*@board_size)
			return display_path
		else
			$movementRule.each_with_index do |coordinates,index|
				new_row_cord = row_cord+coordinates[0]
				new_col_cord = col_cord+coordinates[1]
				if(is_move_valid(new_row_cord, new_col_cord))
					@move+=1
					@board[new_row_cord][new_col_cord]=@move
					if (make_the_move(new_row_cord,new_col_cord))
						return true
					end
					@move-=1
					@board[new_row_cord][new_col_cord]=0
				end
			end
		end
		return false
	end
	def display_path
		puts "Output: "
		@board.each do |row|
			row.each do |move|
				print move >= 100 ? "#{move} " : (move < 10 ? "  #{move} " : " #{move} ")
			end
			puts ""
		end
		return true
	end
end