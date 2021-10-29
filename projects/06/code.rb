class Code
  COMP_MAP = {
    "0" => "101010",
    "1" => "111111",
    "-1" => "111010",
    "D" => "001100",
    "A" => "110000",
    "!D" => "001101",
    "!A" => "110001",
    "-D" => "001111",
    "-A" => "110011",
    "D+1" => "011111",
    "A+1" => "110111",
    "D-1" => "001110",
    "A-1" => "110010",
    "D+A" => "000010",
    "D-A" => "010011",
    "A-D" => "000111",
    "D&A" => "000000",
    "D|A" => "010101"
  }.freeze

  JUMP_MAP = {
    "null" => "000",
    "JGT" => "001",
    "JEQ" => "010",
    "JGE" => "011",
    "JLT" => "100",
    "JNE" => "101",
    "JLE" => "110",
    "JMP" => "111"
  }.freeze

  class << self
    def dest(str)
      res = "000"
      res[0] = "1" if str.include?("A")
      res[1] = "1" if str.include?("D")
      res[2] = "1" if str.include?("M")
      res
    end

    def comp(str)
      (str.include?("M") ? "1" : "0") + COMP_MAP[str.tr("M", "A")]
    end

    def jump(str)
      JUMP_MAP[str]
    end
  end
end
