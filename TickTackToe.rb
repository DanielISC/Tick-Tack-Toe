require './win'
class TickTackToe < Win
  def initialize(size = 3)
    @size = size.to_i
    @turn = "X"
    doBoard
  end

  def method_missing(m, *args)
      puts "Method #{m} not found"
  end

  def play
    endGame = 0
    mov = 0
    @turn = "O"
    while endGame != "2"
      @turn = (@turn == "O" ) ? "X" : "O"
      r = ""
      c = ""
      loop do
        signBoard
        puts "Player #{@turn}"
        puts "Row:"
        r = gets.chomp
        if r.to_i == 0 || r.to_i > @size
          puts "Invalid position"
          gets.chomp
        else
          puts "Col:"
          c = gets.chomp
          if c.to_i == 0 || c.to_i > @size
            puts "Invalid position"
            gets.chomp
          else
            break if @board[(r.to_i - 1)][(c.to_i - 1)] == " "
            puts "Invalid position"
            gets.chomp
            signBoard
          end
        end
      end
      mov = mov + 1
      @board[(r.to_i - 1)][(c.to_i - 1)] = @turn
      win = valWin(r.to_i - 1, c.to_i - 1)
      if win != " "
        signBoard
        puts "#{win.to_s} is the winner"
        gets.chomp
        @turn = (@turn == "O" ) ? "X" : "O"
      end
      loop do
        if mov == (@size ** 2) or win != " "
          puts "¿Play again?"
          puts "1: Yes"
          puts "2: No"
          endGame = gets.chomp
          if (endGame.to_i <= 0 or endGame.to_i >= 3)
            puts "Invalid option"
            gets.chomp
            signBoard
          else
            if endGame == "1"
              mov = 0
              doBoard
            end
            break
          end
        else
          break
        end
      end
      signBoard
    end
  end
  
end
