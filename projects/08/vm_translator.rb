require_relative "parser"
require_relative "code_writer"

class VmTranslator
  def initialize(input)
    @parser = Parser.new(input)
    @code_writer = CodeWriter.new(input.gsub(".vm", ".asm"))
  end

  def translate
    while @parser.has_more_lines?
      @parser.advance
      case @parser.command_type
      when "C_ARITHMETIC"
        @code_writer.write_arithmetic(@parser.arg1)
      when "C_PUSH", "C_POP"
        @code_writer.write_push_pop(@parser.command_type, @parser.arg1, @parser.arg2)
      when "C_LABEL"
        @code_writer.write_label(@parser.arg1)
      when "C_GOTO"
        @code_writer.write_goto(@parser.arg1)
      when "C_IF"
        @code_writer.write_if(@parser.arg1)
      when "C_FUNCTION"
        @code_writer.write_function(@parser.arg1, @parser.arg2)
      when "C_CALL"
        @code_writer.write_call(@parser.arg1, @parser.arg2)
      when "C_RETURN"
        @code_writer.write_return
      end
    end

    @code_writer.infinite_loop
    @code_writer.close
  end
end

VmTranslator.new(ARGV[0]).translate
