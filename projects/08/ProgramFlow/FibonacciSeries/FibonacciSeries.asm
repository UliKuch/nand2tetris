// push argument 1
@1
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
// push constant 0
@0
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@0
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
// push constant 1
@1
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop that 1
@1
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
// push constant 2
@2
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
(MAIN_LOOP_START)
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
@COMPUTE_ELEMENT
D;JNE
// unconditional jump to label
@END_PROGRAM
0;JMP
(COMPUTE_ELEMENT)
// push that 0
@0
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
// push that 1
@1
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
// pop that 2
@2
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
// push pointer 1
@THAT
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
// unconditional jump to label
@MAIN_LOOP_START
0;JMP
(END_PROGRAM)
(END)
@END
0;JMP
