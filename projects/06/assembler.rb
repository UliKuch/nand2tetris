require_relative "parser"
require_relative "code"
require_relative "symbol_table"

class Assembler
  def initialize(input)
    @parser = Parser.new(input)
    @symbol_table = SymbolTable.new
    @output = File.open(input.gsub(".asm", ".hack"), "w")
  end

  def assemble
    prepare_symbol_table

    parser_loop do
      case @parser.instruction_type
      when "A_INSTRUCTION"
        int_value = begin
          Integer(@parser.symbol)
        rescue
          nil
        end

        int_value ||= if @symbol_table.contains?(@parser.symbol)
          @symbol_table.get_address(@parser.symbol)
        else
          new_address = @symbol_table.use_next_available_address
          @symbol_table.add_entry(@parser.symbol, new_address)
          new_address
        end

        @output.puts("0" + int_value.to_s(2).rjust(15, "0"))
      when "C_INSTRUCTION"
        @output.puts("111" + Code.comp(@parser.comp) + Code.dest(@parser.dest) + Code.jump(@parser.jump))
      end
    end

    @output.close
  end

  private

  def prepare_symbol_table
    line_count = 0

    parser_loop do
      case @parser.instruction_type
      when "A_INSTRUCTION", "C_INSTRUCTION"
        line_count += 1
      when "L_INSTRUCTION"
        @symbol_table.add_entry(@parser.symbol, line_count + 1)
      end
    end

    @parser.rewind
  end

  def parser_loop(&block)
    loop do
      break unless @parser.has_more_lines?
      @parser.advance

      yield
    end
  end
end

Assembler.new(ARGV[0]).assemble
