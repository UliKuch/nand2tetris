(SimpleFunction.test)
// initialize local variables
@2
D=A
(SimpleFunction.test$INIT_LCL_VAR)
// break loop if D is 0
@SimpleFunction.test$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@SimpleFunction.test$INIT_LCL_VAR
0;JMP
(SimpleFunction.test$CONT)
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
// push local 1
@1
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
// save LCL (as frame) in R14
@LCL
D=M
@R14
M=D
// save return address in R15
@5
D=D-A
A=D // we don't want to save (frame-5)
D=M // but a pointer to what is saved in (frame - 5), i.e. *(frame - 5) (I think...)
@R15
M=D
// set memory ARG points to to popped value
// pop and store address in A
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// set SP to ARG+1
@ARG
D=M
D=D+1
@SP
M=D
// set THAT to *(frame - 1)
@R14
D=M
@1
D=D-A
A=D
D=M
@THAT
M=D
// set THIS to *(frame - 2)
@R14
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
// set ARG to *(frame - 3)
@R14
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
// set LCL to *(frame - 4)
@R14
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
// goto return address
@R15
A=M
0;JMP
(END)
@END
0;JMP
