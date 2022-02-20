// push constant 0
@0
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@0
D=A
@LCL
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
(LOOP_START)
// push argument 0
@0
D=A
@ARG
A=M+D
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@0
D=A
@LCL
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
// pop local 0
@0
D=A
@LCL
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
// push argument 0
@0
D=A
@ARG
A=M+D
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
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
// pop argument 0
@0
D=A
@ARG
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
// push argument 0
@0
D=A
@ARG
A=M+D
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop and store address in A
@SP
M=M-1
A=M
D=M
// jump to label if popped value is not zero
@LOOP_START
D;JNE
// push local 0
@0
D=A
@LCL
A=M+D
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
(END)
@END
0;JMP
