require './board'
class Win < Board
  def valWin(r, c)
    i = val = 0
    while i < 4
      case i
      when 0
        y = -1
        x = 0
      when 1
        y = 0
        x = -1
      when 2
        y = -1
        x = -1
      else
        y = -1
        x = 1
      end
      (0...3).each do |j|
        rowLim = r + ((-1 * y) * j)
        colLim = c + ((-1 * x) * j)
        if (rowLim < @size and colLim < @size) and @board[rowLim][colLim] == @turn
          (1...3).each do |k|
            rowMov = rowLim + ( k * y)
            colMov = colLim + ( k * x)
            if (rowMov >= 0 and colMov >= 0) and (rowMov < @size and colMov < @size) and @board[rowMov][colMov] == @turn
              val = val + 1
            else
              break
            end
          end
          if val == 2
            return "Player #{@turn}"
          else
            val = 0
          end
        end
      end
      i += 1
    end
    return " "
  end
  
end
