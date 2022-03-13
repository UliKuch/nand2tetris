class CodeWriter
  SEGMENT_SYMBOL_MAP = {
    "argument" => "ARG",
    "local" => "LCL",
    "this" => "THIS",
    "that" => "THAT",
    "pointer 0" => "THIS",
    "pointer 1" => "THAT",
    "temp" => 5
  }

  COMMAND_INSTR_MAP = {
    "add" => "D+M",
    "sub" => "M-D",
    "neg" => "-M",
    "eq" => "JEQ",
    "gt" => "JGT",
    "lt" => "JLT",
    "and" => "D&M",
    "or" => "D|M",
    "not" => "!M"
  }

  def initialize(output)
    @output = File.open(output, "w")
    @filename = output.split("/").last.split(".").first
    @comp_jump_counter = 0
  end

  def write_arithmetic(command)
    out = case command
    when "neg", "not"
      <<~ASM
        // #{command}
        #{pop_and_store_address_in_a}
        D=#{COMMAND_INSTR_MAP[command]}
        #{push_d_to_stack}
      ASM
    when "eq", "gt", "lt"
      @comp_jump_counter += 1
      <<~ASM
        // #{command}
        #{pop_and_store_address_in_a}
        D=M
        #{pop_and_store_address_in_a}
        D=M-D
        @TRUE_#{@comp_jump_counter}
        D;#{COMMAND_INSTR_MAP[command]}
        D=0 // FALSE
        #{push_d_to_stack}
        @CONT_#{@comp_jump_counter}
        0;JMP
        (TRUE_#{@comp_jump_counter})
        D=-1 // TRUE
        #{push_d_to_stack}
        (CONT_#{@comp_jump_counter})
      ASM
    else
      <<~ASM
        // #{command}
        #{pop_and_store_address_in_a}
        D=M
        #{pop_and_store_address_in_a}
        D=#{COMMAND_INSTR_MAP[command]}
        #{push_d_to_stack}
      ASM
    end

    @output.puts out
  end

  def write_push_pop(command, segment, index)
    case command
    when "C_PUSH"
      @output.puts push(segment, index)
    when "C_POP"
      @output.puts pop(segment, index)
    end
  end

  def write_label(label)
    @output.puts "(#{label})"
  end

  def write_goto(label)
    goto = <<~ASM
      // unconditional jump to label
      @#{label}
      0;JMP
    ASM

    @output.puts goto
  end

  def write_if(label)
    if_goto = <<~ASM
      #{pop_and_store_address_in_a}
      D=M
      // jump to label if popped value is not zero
      @#{label}
      D;JNE
    ASM

    @output.puts if_goto
  end

  def write_function(function_name, n_vars)
    funct = <<~ASM
      (#{function_name})
      // initialize local variables
      @#{n_vars}
      D=A
      (#{function_name}$INIT_LCL_VAR)
      // break loop if D is 0
      @#{function_name}$CONT
      D;JEQ
      D=D-1
      // push 0 to stack
      @SP
      A=M
      M=0
      @SP
      M=M+1
      @#{function_name}$INIT_LCL_VAR
      0;JMP
      (#{function_name}$CONT)
    ASM

    @output.puts funct
  end

  def write_call(function_name, n_args)
  end

  def write_return
    ret = <<~ASM
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
      #{pop_and_store_address_in_a}
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
    ASM

    @output.puts ret
  end

  def infinite_loop
    out = <<~ASM
      (END)
      @END
      0;JMP
    ASM

    @output.puts out
  end

  def close
    @output.close
  end

  private

  def push(segment, index)
    segment_logic = case segment
    when "constant"
      <<~ASM
        @#{index}
        D=A
      ASM
    when "static"
      <<~ASM
        @#{@filename}.#{index}
        D=M
      ASM
    when "temp"
      <<~ASM
        @#{SEGMENT_SYMBOL_MAP[segment] + index.to_i}
        D=M
      ASM
    when "pointer"
      <<~ASM
        @#{SEGMENT_SYMBOL_MAP["#{segment} #{index}"]}
        D=M
      ASM
    else
      <<~ASM
        @#{index}
        D=A
        @#{SEGMENT_SYMBOL_MAP[segment]}
        A=M+D
        D=M
      ASM
    end.strip

    <<~ASM
      // push #{segment} #{index}
      #{segment_logic}
      #{push_d_to_stack}
    ASM
      .strip
  end

  def pop(segment, index)
    segment_logic = case segment
    when "static"
      <<~ASM
        @#{@filename}.#{index}
        D=A
      ASM
    when "temp"
      <<~ASM
        @#{SEGMENT_SYMBOL_MAP[segment] + index.to_i}
        D=A
      ASM
    when "pointer"
      <<~ASM
        @#{SEGMENT_SYMBOL_MAP["#{segment} #{index}"]}
        D=A
      ASM
    else
      <<~ASM
        @#{index}
        D=A
        @#{SEGMENT_SYMBOL_MAP[segment]}
        D=D+M
      ASM
    end.strip

    <<~ASM
      // pop #{segment} #{index}
      #{segment_logic}
      // store D in R13
      @R13
      M=D
      #{pop_and_store_address_in_a}
      D=M
      // go to address stored in R13, store D there
      @R13
      A=M
      M=D
    ASM
      .strip
  end

  def push_d_to_stack
    <<~ASM
      // push D to stack
      @SP
      A=M
      M=D
      @SP
      M=M+1
    ASM
      .strip
  end

  def pop_and_store_address_in_a
    <<~ASM
      // pop and store address in A
      @SP
      M=M-1
      A=M
    ASM
      .strip
  end
end
