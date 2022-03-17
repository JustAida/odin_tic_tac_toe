# Board template. [Use "." as empty spaces.]
# |.|.|.|
# |.|.|.|
# |.|.|.|

class Board
  def initialize
    @marks = Array.new(9, ".")
    @current = format("\n|%s|%s|%s|\n|%s|%s|%s|\n|%s|%s|%s|", *@marks)
  end

  def display
    @current
  end

  def update
    @current = format("\n|%s|%s|%s|\n|%s|%s|%s|\n|%s|%s|%s|", *@marks)
  end

  def place(player, position)
    @marks[position.to_i - 1] = player
    update
  end

  def valid?(position)
    @marks[position.to_i - 1] == "."
  end

  def winner?
    return false if marks_size < 3

    [0, 1, 2, 3, 6].each do |i|
      next if @marks[i] == "."
      # Check vertical.
      return true if [0, 1, 2].include?(i) && same_three_marks?(@marks[i], @marks[i + 3], @marks[i + 6]) &&
                     no_empty?(@marks[i], @marks[i + 3], @marks[i + 6])

      # Check horizontal.
      return true if [0, 3, 6].include?(i) && same_three_marks?(@marks[i], @marks[i + 1], @marks[i + 2]) &&
                     no_empty?(@marks[i], @marks[i + 1], @marks[i + 2])

      # Check diagonal.
      return true if i.zero? && same_three_marks?(@marks[0], @marks[4], @marks[8]) &&
                     no_empty?(@marks[0], @marks[4], @marks[8])
      return true if i == 2 && same_three_marks?(@marks[2], @marks[4], @marks[6]) &&
                     no_empty?(@marks[2], @marks[4], @marks[6])
    end
    false
  end

  def marks_size
    @marks.select { |mark| mark != "." }.size
  end

  def same_three_marks?(mark1, mark2, mark3)
    [mark1, mark2, mark3].uniq.size == 1
  end

  def no_empty?(mark1, mark2, mark3)
    ![mark1, mark2, mark3].include?(".")
  end

  def tie?
    !@marks.include?(".")
  end
end

PLAYER_X = "X"
PLAYER_O = "O"
board = Board.new
player_turn = [PLAYER_O, PLAYER_X].sample

# Loop the game until there is a winner.
loop do
  puts board.display

  # Ask the player the location to place "X" or "O" on the board.
  puts "\nIt's #{player_turn} turn. Please type number."
  puts "[1 - 9] From left to right."
  position = gets.chomp

  until board.valid?(position)
    puts "The board is not empty on that space. Please type another number."
    position = gets.chomp
  end

  board.place(player_turn, position)

  # If the loop stops then the current player is the winner.
  if board.winner?
    puts board.display
    winner = player_turn
    puts "Player #{winner} wins!"
    exit
  end

  if board.tie?
    puts board.display
    puts "It's a tie!"
    exit
  end

  # Switch the turn of the player.
  player_turn = player_turn == PLAYER_O ? PLAYER_X : PLAYER_O
end
