class Board
  def method_missing(m, *args)
      puts "Method #{m} not found"
  end

  def doBoard
    size = @size
    while size.to_i < 3
      if size.to_i < 3
        puts "Size no valid"
        gets.chomp
        system("cls")
      end
      puts "Size of board"
      size = gets.chomp
    end
    @size = size.to_i
    @board = Array.new(@size){Array.new(@size)}
    (0...@size).each do |i|
      (0...@size).each {|j| @board[i][j] = " "}
    end
  end

  def signBoard
    system("cls")
    puts "Tick Tack Toe"
    (1..@size).each {|i| print " #{i}", '  ' }
    (0...@size).each do |i|
      print "\n#{i + 1}"
      (0...@size).each do |j|
        print " #{@board[i][j]} "
        if (j + 1) < @size
          print "|"
        end
      end
      print "\n"
      if i < (@size - 1)
        (0...@size).each {|k| print " ---"}
      end
    end
  end

end
