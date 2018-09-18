class Tttoe
  def tablero(tamaño)
    tab = Array.new(tamaño){Array.new(tamaño)}
    for i in 0...tamaño
      for j in 0...tamaño
        tab[i][j] = " "
      end
    end
    jugar(tamaño, tab)
    return tab
  end
  def muestraTab(tamaño, tab)
    system("cls")
    puts "Tick Tack Toe"
    col = " "
    for k in 1...(tamaño+1)
      col = col + k.to_s + "   "
    end
    puts col
    for i in 0...tamaño
      ren = ""
      number = i + 1
      for j in 0...tamaño
        if (j + 1) < tamaño
            ren = ren + " " + tab[i][j] + " " + "|"
        else
          ren = ren + " " + tab[i][j] + " "
        end
      end
      puts number.to_s + ren
      ren = ""
      for k in 0...tamaño
        ren = ren + " " + "---"
      end
      if (i + 1) < tamaño
        puts ren
      end
    end
  end
  def jugar (tamaño, tab)
    fin = 0
    mov = 0
    turno = "O"
    while fin != "2"
      if turno == "O"
        turno = "X"
      else
        turno = "O"
      end
      r = ""
      c = ""
      loop do
        muestraTab(tamaño, tab)
        puts "Jugador " + turno
        puts "Renglon:"
        r = gets.chomp
        if r.to_i == 0 || r.to_i > tamaño
          puts "Posicion no valida"
          gets.chomp
        else
          puts "Columna:"
          c = gets.chomp
          if c.to_i == 0 || c.to_i > tamaño
            puts "Posicion no valida"
            gets.chomp
          else
            break if tab[(r.to_i - 1)][(c.to_i - 1)] == " "
            puts "Lugar ya ocupado"
            gets.chomp
            muestraTab(tamaño, tab)
            puts "Se lleno o.o"
          end
        end
      end
      mov = mov + 1
      tab[(r.to_i - 1)][(c.to_i - 1)] = turno
      gana = valGana(tamaño, tab, r.to_i - 1, c.to_i - 1, turno)
      if gana != " "
        muestraTab(tamaño, tab)
        puts "Gano el " + gana.to_s
        gets.chomp
        if turno == "O"
          turno = "X"
        else
          turno = "O"
        end
      end
      loop do
        if mov == (tamaño ** 2) or gana != " "
          puts "¿Seguir jugando?"
          puts "1: Si"
          puts "2: No"
          fin = gets.chomp
          if (fin.to_i <= 0 and fin.to_i >= 3)
            puts "opcion no valida"
            muestraTab(tamaño, tab)
          else
            if fin == "1"
              mov = 0
              tab = tablero(tamaño)
            end
            break
          end
        else
          break
        end
      end
      muestraTab(tamaño, tab)
    end
  end

  def valGana(tamaño, tab, r, c, turno)
    i = val = 0
    while i < 4
      case i
      when 0
        rMov = -1
        cMov = 0
        rlim = 1
        clim = 0
      when 1
        rMov = 0
        cMov = -1
        rlim = 0
        clim = 1
      when 2
        rMov = -1
        cMov = -1
        rlim = 1
        clim = 1
      else
        rMov = -1
        cMov = 1
        rlim = 1
        clim = -1
      end
      for mov in 0...3
        if (r + (rlim*mov)) < tamaño and (c + (clim*mov)) < tamaño and tab[(r + (rlim*mov))][(c + (clim*mov))] == turno
          r2 = r + (rlim*mov)
          c2 = c + (clim*mov)
          for j in 1...3
            if (r2+(j*rMov) >= 0 and c2+(j*cMov) >= 0) and (r2+(j*rMov) < tamaño and c2+(j*cMov) < tamaño) and tab[r2+(j*rMov)][c2+(j*cMov)] == turno
              val = val + 1
            else
              break
            end
          end
          if val == 2
            return "Jugador " + turno
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

tamaño = ""
while tamaño.to_i < 3
  puts "Tamaño del tablero"
  tamaño = gets.chomp
  if tamaño.to_i < 3
    puts "Tamaño no valido"
    gets.chomp
    system("cls")
  end
end
juego = Tttoe.new
tablero = juego.tablero(tamaño.to_i)
