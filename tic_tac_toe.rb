# Board template. [Use "." as empty spaces.]
# |.|.|.|
# |.|.|.|
# |.|.|.|

class Board
  def initialize
    @marks = Array.new(9, ".")
    @current = format("|%s|%s|%s|\n|%s|%s|%s|\n|%s|%s|%s|", *@marks)
  end

  def display
    @current
  end

  def update
    @current = format("|%s|%s|%s|\n|%s|%s|%s|\n|%s|%s|%s|", *@marks)
  end

  # Create a method to place "X" or "O" on the board.
  def place(player, position)
    @marks[position] = player
    update
  end

  # Create a method to check if there is a winner.
  def winner?
    3.times do |i|
      # Check horizontally.
      return true if [@marks[i], @marks[i + 1], @marks[i + 2]].uniq.size == 1
      # Check vertically.
      return true if [@marks[i], @marks[i + 3], @marks[i + 6]].uniq.size == 1
    end
    # Check diagonally.
    return true if [@marks[0], @marks[4], @marks[8]].uniq.size == 1
    return true if [@marks[2], @marks[4], @marks[6]].uniq.size == 1
  end
end

# Loop the game until there is a winner.
# Ask the player the location to place "X" or "O" on the board.
# Display the board.
# Switch the turn of the player.

# A message to declare the winner.
