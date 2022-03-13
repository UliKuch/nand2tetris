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
// push constant 4000
@4000
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
// push constant 5000
@5000
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
// generate and push return address to stack
@Sys.main$ret.2
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
@Sys.main
0;JMP
(Sys.main$ret.2)
// pop temp 1
@6
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
(LOOP)
// unconditional jump to label
@LOOP
0;JMP
(Sys.main)
// initialize local variables
@5
D=A
(Sys.main$INIT_LCL_VAR)
// break loop if D is 0
@Sys.main$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Sys.main$INIT_LCL_VAR
0;JMP
(Sys.main$CONT)
// push constant 4001
@4001
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
// push constant 5001
@5001
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
// push constant 200
@200
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
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
// push constant 40
@40
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@2
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
// push constant 6
@6
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@3
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
// push constant 123
@123
D=A
// push D to stack
@SP
A=M
M=D
@SP
M=M+1
// generate and push return address to stack
@Sys.add12$ret.3
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
@Sys.add12
0;JMP
(Sys.add12$ret.3)
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
// push local 2
@2
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
// push local 3
@3
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
// push local 4
@4
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
(Sys.add12)
// initialize local variables
@0
D=A
(Sys.add12$INIT_LCL_VAR)
// break loop if D is 0
@Sys.add12$CONT
D;JEQ
D=D-1
// push 0 to stack
@SP
A=M
M=0
@SP
M=M+1
@Sys.add12$INIT_LCL_VAR
0;JMP
(Sys.add12$CONT)
// push constant 4002
@4002
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
// push constant 5002
@5002
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
// push constant 12
@12
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
