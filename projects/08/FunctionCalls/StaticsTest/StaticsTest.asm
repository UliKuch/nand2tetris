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
(Class1.set)
// initialize local variables
@0
D=A
(Class1.set$INIT_LCL_VAR)
// break loop if D is 0
@Class1.set$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Class1.set$INIT_LCL_VAR
0;JMP
(Class1.set$CONT)
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
// pop static 0
@Class1.0
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
// pop static 1
@Class1.1
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
(Class1.get)
// initialize local variables
@0
D=A
(Class1.get$INIT_LCL_VAR)
// break loop if D is 0
@Class1.get$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Class1.get$INIT_LCL_VAR
0;JMP
(Class1.get$CONT)
// push static 0
@Class1.0
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class1.1
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
(Class2.set)
// initialize local variables
@0
D=A
(Class2.set$INIT_LCL_VAR)
// break loop if D is 0
@Class2.set$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Class2.set$INIT_LCL_VAR
0;JMP
(Class2.set$CONT)
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
// pop static 0
@Class2.0
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
// pop static 1
@Class2.1
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
(Class2.get)
// initialize local variables
@0
D=A
(Class2.get$INIT_LCL_VAR)
// break loop if D is 0
@Class2.get$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Class2.get$INIT_LCL_VAR
0;JMP
(Class2.get$CONT)
// push static 0
@Class2.0
D=M
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Class2.1
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
// push constant 6
@6
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
// generate and push return address to stack
@Class1.set$ret.2
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
@2
D=D-A
@ARG
M=D
// set LCL to SP
@SP
D=M
@LCL
M=D
// goto function
@Class1.set
0;JMP
(Class1.set$ret.2)
// pop temp 0
@5
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
// push constant 23
@23
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// generate and push return address to stack
@Class2.set$ret.3
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
@2
D=D-A
@ARG
M=D
// set LCL to SP
@SP
D=M
@LCL
M=D
// goto function
@Class2.set
0;JMP
(Class2.set$ret.3)
// pop temp 0
@5
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
// generate and push return address to stack
@Class1.get$ret.4
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
@Class1.get
0;JMP
(Class1.get$ret.4)
// generate and push return address to stack
@Class2.get$ret.5
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
@Class2.get
0;JMP
(Class2.get$ret.5)
(WHILE)
// unconditional jump to label
@WHILE
0;JMP
