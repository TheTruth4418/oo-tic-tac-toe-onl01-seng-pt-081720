require 'pry'
class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],
    [6,7,8], [0,3,6],
    [0,4,8], [1,4,7],
    [2,5,8], [2,4,6]
  ]

  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts"----------------------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts"----------------------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts"----------------------------"
  end

  def input_to_index(move)
    move.to_i - 1
  end

  def move(index,token = "X")
    input_to_index = index
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    position_taken?(index) == false && index >= 0 && index <= 8 ? true : false
  end

  def turn_count
    count = 0
    @board.each do |x|
      count += 1 if x == "X" || x =="O"
    end
    count
  end

  def current_player
    move = ""
    turn_count % 2 == 0 ? move = "X" : move = "O"
    move
  end

  def turn
    puts "Enter a number 1-9"
    index_move = gets.chomp
    move2 = input_to_index(index_move)
    if valid_move?(move2)
       token = current_player
       move(move2, token)
       display_board
     else
       turn
     end
  end

  def won?
    def won?
      WIN_COMBINATIONS.detect do |combo|
        if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
          return combo
        elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
          return combo
        end
          false
      end
    end
end
# Asking the board if it has the index combinations listed in the conditions array by stepping through each one of the win combo elements
end
