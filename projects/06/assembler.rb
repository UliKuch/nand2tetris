require_relative "parser"
require_relative "code"

class Assembler
  def initialize(input)
    @parser = Parser.new(input)
    output_filename = input.gsub(".asm", ".hack")
    @output = File.open(output_filename, "w")
  end

  def assemble
    loop do
      break unless @parser.has_more_lines?
      @parser.advance

      case @parser.instruction_type
      when "A_INSTRUCTION"
        @output.puts("0" + @parser.symbol.to_i.to_s(2).rjust(15, "0"))
      when "C_INSTRUCTION"
        @output.puts("111" + Code.comp(@parser.comp) + Code.dest(@parser.dest) + Code.jump(@parser.jump))
      end
    end

    @output.close
  end
end

Assembler.new(ARGV[0]).assemble
