// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
@SCREEN
D=A
@Position 
M=D-1

(CHECK)
@KBD
D=M      
@BLACKEN 
D;JGT
@WHITEN 
0;JMP

//Start blacken the Screen
(BLACKEN)
@24576
D=M
@Position
D=D-M
@CHECK
D;JEQ

//else start blacken
@Position
A=M
M=-1

//go to next position
@Position
D=M+1
@Position
M=D

//go to check if user is still hold the key
@CHECK
0;JMP


//Start whiten the Screen
(WHITEN)
@SCREEN
D=A-1    
@Position
D=D-M
@CHECK
D;JEQ

//else start whiten
@Position
A=M
M=0

//draw back position
@Position
D=M-1
@Position
M=D

//check if there is any key pressed by user
@CHECK
0;JMP
