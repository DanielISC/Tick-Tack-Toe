# Tick-Tack-Toe

In this project is to recreate the game of the cat where there are 3 players one that uses the X as a brand and another the O. The winner is defined when a line of 3 marks is joined either vertically, horizontally or diagonally

## Getting Started

It is a project for which you need to have ruby installed.

### Installing


You can download the project by clicking on clone or download

![](https://i.imgur.com/uFqpnIh.png)


Placing yourself in the project folder once downloaded run the main.rb file


```
ruby main.rb
```

Which contains an example of how to play the game


``` javascript=
require './TickTackToe'
juego = TickTackToe.new(5)
juego.play
```

El comando sirve para referenciar a la clase principal del proyecto
```
require './TickTackToe'
```
El comando sirve para crear un Tablero con las dimenciones que se deseen
```
juego = TickTackToe.new(5)
```
>si no se asigna tamaño, el tablero se crea de 3x3

El comando inicia el juego
```
juego.play
```
## board file

This file contains the class that creates and displays the board

```
doBoard
```

>Metodo que crea el tablero con las dimenciones requeridas

```
signBoard
```

>Method that paints the board in the console

## win file

This file contains the function that validates if a player wins the game


```
valWin(r, c)
```

>Método que recibe las pocicioes en las que el jugador quiere colocar su marca en el tablero

## TickTackToe file

This file contains the function that controls that the game is carried out

```
play
```

>Method that starts the game

