// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(RESETP)
  @p
  M=0

(LOOP)
  // read keyboard
  @KBD
  D=M

  // goto WHITE if KBD == 0
  @WHITE
  D;JEQ

  // else goto BLACK
  @BLACK
  0;JMP

(CONTINUE)
  // p++
  @p
  M=M+1

  // goto RESETP if *p + SCREEN == KBD (value at p + address of SCREEN == address of KBD; unsure about notation)
  @KBD
  D=A
  @SCREEN
  D=D-A
  @p
  D=D-M
  @RESETP
  D;JEQ

  // goto LOOP
  @LOOP
  0;JMP

(WHITE)
  // *(SCREEN + p) = 0
  @SCREEN
  D=A
  @p
  A=D+M
  M=0

  @CONTINUE
  0;JMP

(BLACK)
  // *(SCREEN + p) = -1
  @SCREEN
  D=A
  @p
  A=D+M
  M=-1

  @CONTINUE
  0;JMP