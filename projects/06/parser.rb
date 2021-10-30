class Parser
  def initialize(input)
    @file = File.open(input, "r")
    @current = nil
  end

  def has_more_lines?
    !@file.eof?
  end

  def advance
    # TODO: handle comments/blank lines at end of file
    loop do
      line = @file.readline
      unless is_comment_or_blank?(line)
        # remove trailing comments, trailing & leading whitespace, carriage returns and newlines
        @current = line.sub(/\/\/.*/, "").strip
        break
      end
    end

    @current
  end

  def rewind
    @file.rewind
    @current = nil
  end

  def instruction_type
    if @current.start_with?("@")
      "A_INSTRUCTION"
    elsif @current.start_with?("(")
      "L_INSTRUCTION"
    else
      "C_INSTRUCTION"
    end
  end

  def symbol
    case instruction_type
    when "A_INSTRUCTION"
      @current.slice(1..)
    when "L_INSTRUCTION"
      @current.slice(1..-2)
    end
  end

  def dest
    return "null" unless @current.include?("=")
    @current.split("=").first
  end

  def comp
    @current.split("=").last.split(";").first
  end

  def jump
    return "null" unless @current.include?(";")
    @current.split(";").last
  end

  private

  def is_comment_or_blank?(str)
    str.strip.start_with?("//") || str.strip == ""
  end
end
