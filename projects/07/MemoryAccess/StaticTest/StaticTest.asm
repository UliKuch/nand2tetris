// push constant 111
@111
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 333
@333
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 888
@888
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop static 8
@StaticTest.8
D=A
// store D in R13
@R13
M=D
// pop and store address in A
@SP
M=M-1
A=M
D=M
// go to address stored in R13, store D there
@R13
A=M
M=D
// pop static 3
@StaticTest.3
D=A
// store D in R13
@R13
M=D
// pop and store address in A
@SP
M=M-1
A=M
D=M
// go to address stored in R13, store D there
@R13
A=M
M=D
// pop static 1
@StaticTest.1
D=A
// store D in R13
@R13
M=D
// pop and store address in A
@SP
M=M-1
A=M
D=M
// go to address stored in R13, store D there
@R13
A=M
M=D
// push static 3
@StaticTest.3
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@StaticTest.1
D=M
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
// push static 8
@StaticTest.8
D=M
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
(END)
@END
0;JMP
