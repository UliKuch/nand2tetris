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
      end
    end

    @code_writer.infinite_loop
    @code_writer.close
  end
end

VmTranslator.new(ARGV[0]).translate
