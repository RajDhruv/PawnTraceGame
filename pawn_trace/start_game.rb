require './lib/pawn_trace'

print "Enter the number of blocks in a row to create board: "
n=gets.strip.to_i
game=PawnTrace.new(n)
print "Enter the row from top where Pawn is to be located: "
row=gets.strip.to_i
print "Enter the column from left where Pawn is to be located: "
col=gets.strip.to_i
puts "Finding a valid Path:"
result=game.start_pawn(row,col)
if result==false
	puts "Output: No Valid Path Exists for Given Inputs"
end