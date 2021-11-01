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
