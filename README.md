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

The command is used to reference the main class of the project
```
require './TickTackToe'
```
The command is used to create a Board with the desired dimensions

```
juego = TickTackToe.new(5)
```
>If size is not assigned, the board is created 3x3


The command starts the game

```
juego.play
```
## board file

This file contains the class that creates and displays the board

```
doBoard
```

>Method that creates the board with the required dimensions

```
signBoard
```

>Method that paints the board in the console

## win file

This file contains the function that validates if a player wins the game


```
valWin(r, c)
```

>Method that receives the positions in which the player wants to place his mark on the board

## TickTackToe file

This file contains the function that controls that the game is carried out

```
play
```

>Method that starts the game
