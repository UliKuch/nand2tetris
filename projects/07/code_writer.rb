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
    case segment
    when "constant"
      <<~ASM
        // push #{segment} #{index}
        @#{index}
        D=A
        #{push_d_to_stack}
      ASM
    when "static"
      <<~ASM
        // push #{segment} #{index}
        @#{@filename}.#{index}
        D=M
        #{push_d_to_stack}
      ASM
    when "temp"
      <<~ASM
        // push #{segment} #{index}
        @#{SEGMENT_SYMBOL_MAP[segment] + index.to_i}
        D=M
        #{push_d_to_stack}
      ASM
    when "pointer"
      <<~ASM
        // push #{segment} #{index}
        @#{SEGMENT_SYMBOL_MAP["#{segment} #{index}"]}
        D=M
        #{push_d_to_stack}
      ASM
    else
      <<~ASM
        // push #{segment} #{index}
        @#{index}
        D=A
        @#{SEGMENT_SYMBOL_MAP[segment]}
        A=M+D
        D=M
        #{push_d_to_stack}
      ASM
    end.strip
  end

  def pop(segment, index)
    case segment
    when "static"
      <<~ASM
        // pop #{segment} #{index}
        @#{@filename}.#{index}
        D=A
        @R13
        M=D
        @SP
        M=M-1
        A=M
        D=M
        @R13
        A=M
        M=D
      ASM
    when "temp"
      <<~ASM
        // pop #{segment} #{index}
        @#{SEGMENT_SYMBOL_MAP[segment] + index.to_i}
        D=A
        @R13
        M=D
        @SP
        M=M-1
        A=M
        D=M
        @R13
        A=M
        M=D
      ASM
    when "pointer"
      <<~ASM
        // pop #{segment} #{index}
        @#{SEGMENT_SYMBOL_MAP["#{segment} #{index}"]}
        D=A
        @R13
        M=D
        @SP
        M=M-1
        A=M
        D=M
        @R13
        A=M
        M=D
      ASM
    else
      <<~ASM
        // pop #{segment} #{index}
        @#{index}
        D=A
        @#{SEGMENT_SYMBOL_MAP[segment]}
        D=D+M
        @R13
        M=D
        @SP
        M=M-1
        A=M
        D=M
        @R13
        A=M
        M=D
      ASM
    end.strip
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
