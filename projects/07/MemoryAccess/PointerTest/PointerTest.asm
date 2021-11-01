// push constant 3030
@3030
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@THIS
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
// push constant 3040
@3040
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1
@THAT
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
// push constant 32
@32
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@2
D=A
@THIS
D=D+M
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
// push constant 46
@46
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop that 6
@6
D=A
@THAT
D=D+M
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
// push pointer 0
@THIS
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push pointer 1
@THAT
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
// push this 2
@2
D=A
@THIS
A=M+D
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
// push that 6
@6
D=A
@THAT
A=M+D
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
