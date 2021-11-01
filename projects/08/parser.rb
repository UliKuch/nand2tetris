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

  def command_type
    case @current
    when "add", "sub", "neg", "eq", "gt", "lt", "and", "or", "not"
      "C_ARITHMETIC"
    when /\Apush/
      "C_PUSH"
    when /\Apop/
      "C_POP"
    when /\Alabel/
      "C_LABEL"
    when /\Agoto/
      "C_GOTO"
    when /\Aif/
      "C_IF"
    when /\Afunction/
      "C_FUNCTION"
    when "return"
      "C_RETURN"
    when /\Acall/
      "C_CALL"
    end
  end

  def arg1
    return @current if command_type == "C_ARITHMETIC"

    @current.split[1]
  end

  def arg2
    @current.split[2]
  end

  private

  def is_comment_or_blank?(str)
    str.strip.start_with?("//") || str.strip == ""
  end
end
