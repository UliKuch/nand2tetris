// push constant 7
@7
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
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
(END)
@END
0;JMP
