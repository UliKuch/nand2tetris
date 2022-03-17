class JackTokenizer
  KEYWORDS = [
    "class", "constructor", "function", "method", "field", "static", "var",
    "int", "char", "boolean", "void", "true", "false", "null", "this", "let",
    "do", "if", "else", "while", "return"
  ]

  SYMBOLS = [
    "{", "}", "(", ")", "[", "]", ".", ",", ";", "+", "-", "*", "/", "&",
    "|", "<", ">", "=", "~"
  ]

  def initialize(file_path)
    @file = File.open(file_path, "r")
    @current_token = nil
    @text = @file.readlines
      .map { |line|
        line.gsub(/[[:space:]]*\/\/.*/, "") # remove trailing comments
          .strip
      }
      .reject(&:empty?) # remove empty lines
      .join(" ") # join all remaining lines to text
      .gsub(/(\/\*)[^\/]*[^*]*(\*\/)/, "") # remove /** */ and /* */ comments
      .gsub(/[[:space:]]+/, " ") # remove duplicate whitespace
      .strip
    @text_pointer = 0
  end

  def has_more_tokens?
    @text_pointer < @text.length
  end

  def advance
    current_char = @text[@text_pointer]

    if SYMBOLS.include?(current_char) # points to a symbol
      @current_token = current_char
      @text_pointer += 1
    elsif current_char == "\"" # points to beginning of a string
      start = @text_pointer
      loop do
        @text_pointer += 1
        break if @text[@text_pointer] == "\""
      end
      @current_token = @text[start..@text_pointer]
      @text_pointer += 1 # set pointer to char after closing double quotes
    else # points to beginning of integer, identifier or keyword
      start = @text_pointer
      loop do
        @text_pointer += 1
        break if (SYMBOLS + [" "]).include?(@text[@text_pointer])
      end
      @current_token = @text[start...@text_pointer]
    end

    # ensure current char is no whitespace
    @text_pointer += 1 if @text[@text_pointer] == " "
  end

  def token_type
    case @current_token
    when *SYMBOLS
      "SYMBOL"
    when *KEYWORDS
      "KEYWORD"
    when /\A(")/
      "STRING_CONST"
    when /\A\d/
      "INT_CONST"
    else
      "IDENTIFIER"
    end
  end

  def keyword
    @current_token.upcase
  end

  def symbol
    @current_token
  end

  def identifier
    @current_token
  end

  def int_val
    @current_token.to_i
  end

  def string_val
    @current_token.delete("\"")
  end
end
