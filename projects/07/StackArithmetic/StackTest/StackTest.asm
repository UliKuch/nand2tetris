// push constant 17
@17
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// eq
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_1
D;JEQ
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_1
0;JMP
(TRUE_1)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_1)
// push constant 17
@17
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// eq
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_2
D;JEQ
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_2
0;JMP
(TRUE_2)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_2)
// push constant 16
@16
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// eq
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_3
D;JEQ
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_3
0;JMP
(TRUE_3)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_3)
// push constant 892
@892
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// lt
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_4
D;JLT
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_4
0;JMP
(TRUE_4)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_4)
// push constant 891
@891
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// lt
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_5
D;JLT
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_5
0;JMP
(TRUE_5)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_5)
// push constant 891
@891
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// lt
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_6
D;JLT
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_6
0;JMP
(TRUE_6)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_6)
// push constant 32767
@32767
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// gt
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_7
D;JGT
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_7
0;JMP
(TRUE_7)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_7)
// push constant 32766
@32766
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// gt
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_8
D;JGT
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_8
0;JMP
(TRUE_8)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_8)
// push constant 32766
@32766
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// gt
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
@TRUE_9
D;JGT
D=0 // FALSE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
@CONT_9
0;JMP
(TRUE_9)
D=-1 // TRUE
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(CONT_9)
// push constant 57
@57
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// add
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=D+M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 112
@112
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// sub
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=M-D
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// neg
// pop and store address in A
@SP
M=M-1
A=M
D=-M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// and
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=D&M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 82
@82
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// or
// pop and store address in A
@SP
M=M-1
A=M
D=M
// pop and store address in A
@SP
M=M-1
A=M
D=D|M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// not
// pop and store address in A
@SP
M=M-1
A=M
D=!M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(END)
@END
0;JMP
