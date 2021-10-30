class SymbolTable
  PREDEFINED_SYMBOLS = {
    "SP" => 0,
    "LCL" => 1,
    "ARG" => 2,
    "THIS" => 3,
    "THAT" => 4,
    "SCREEN" => 16384,
    "KBD" => 24576
  }

  # add R0, R1,..., R15 as 0, 1,..., 15 to predefined symbols
  (0..15).each do |n|
    PREDEFINED_SYMBOLS["R#{n}"] = n
  end

  FIRST_AVAILABLE_ADDRESS = 16

  def initialize
    @table = PREDEFINED_SYMBOLS.dup
    @next_available_address = FIRST_AVAILABLE_ADDRESS
  end

  def add_entry(symbol, address)
    @table[symbol] = address
  end

  def contains?(symbol)
    @table.key?(symbol)
  end

  def get_address(symbol)
    @table[symbol]
  end

  def use_next_available_address
    @next_available_address += 1
    @next_available_address - 1
  end
end
