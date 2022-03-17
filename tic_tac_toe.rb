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
      if @marks[i] == @marks[i + 1] && marks[i + 1] == @marks[i + 2]
        return true
      # Check vertically.
      elsif @marks[i] == @marks[i + 3] && marks[i + 3] == @marks[i + 6]
        return true
      # Check diagonally.
      elsif (i == 0) && (@marks[i] == @marks[i + 4]) && (@marks[i + 4] == @marks[i + 8])
        return true
      elsif (i == 2) && (@marks[i] == @marks[i + 2]) && (@marks[i + 2] == @marks[i + 4])
        return true
      else
        return false
    end
  end

# Loop the game until there is a winner.
# Ask the player the location to place "X" or "O" on the board.
# Display the board.
# Switch the turn of the player.

# A message to declare the winner.
