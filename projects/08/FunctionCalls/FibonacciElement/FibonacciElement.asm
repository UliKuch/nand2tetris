// initialize stack pointer
@256
D=A
@SP
M=D
// generate and push return address to stack
@Sys.init$ret.1
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push LCL to stack
@LCL
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push ARG to stack
@ARG
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THIS to stack
@THIS
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THAT to stack
@THAT
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// set ARG to SP - 5 - n_args
@SP
D=M
@5
D=D-A
@0
D=D-A
@ARG
M=D
// set LCL to SP
@SP
D=M
@LCL
M=D
// goto function
@Sys.init
0;JMP
(Sys.init$ret.1)
(Main.fibonacci)
// initialize local variables
@0
D=A
(Main.fibonacci$INIT_LCL_VAR)
// break loop if D is 0
@Main.fibonacci$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Main.fibonacci$INIT_LCL_VAR
0;JMP
(Main.fibonacci$CONT)
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
@TRUE_2
D;JLT
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
// pop and store address in A
@SP
M=M-1
A=M
D=M
// jump to label if popped value is not zero
@IF_TRUE
D;JNE
// unconditional jump to label
@IF_FALSE
0;JMP
(IF_TRUE)
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
(IF_FALSE)
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
// generate and push return address to stack
@Main.fibonacci$ret.3
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push LCL to stack
@LCL
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push ARG to stack
@ARG
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THIS to stack
@THIS
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THAT to stack
@THAT
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// set ARG to SP - 5 - n_args
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// set LCL to SP
@SP
D=M
@LCL
M=D
// goto function
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.3)
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
// generate and push return address to stack
@Main.fibonacci$ret.4
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push LCL to stack
@LCL
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push ARG to stack
@ARG
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THIS to stack
@THIS
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THAT to stack
@THAT
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// set ARG to SP - 5 - n_args
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// set LCL to SP
@SP
D=M
@LCL
M=D
// goto function
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.4)
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
(Sys.init)
// initialize local variables
@0
D=A
(Sys.init$INIT_LCL_VAR)
// break loop if D is 0
@Sys.init$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Sys.init$INIT_LCL_VAR
0;JMP
(Sys.init$CONT)
// push constant 4
@4
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// generate and push return address to stack
@Main.fibonacci$ret.5
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push LCL to stack
@LCL
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push ARG to stack
@ARG
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THIS to stack
@THIS
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push THAT to stack
@THAT
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// set ARG to SP - 5 - n_args
@SP
D=M
@5
D=D-A
@1
D=D-A
@ARG
M=D
// set LCL to SP
@SP
D=M
@LCL
M=D
// goto function
@Main.fibonacci
0;JMP
(Main.fibonacci$ret.5)
(WHILE)
// unconditional jump to label
@WHILE
0;JMP
