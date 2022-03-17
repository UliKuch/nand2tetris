require_relative "jack_tokenizer"

class JackAnalyzer
  def initialize(input)
    if File.directory?(input)
      @input_file_paths = Dir["#{input}/*.jack".gsub("//", "/")]
      @output_folder_path = input.chomp("/") + "_Compiled"
    else
      @input_file_paths = [input]
      @output_folder_path = input.split("/")[0..-2].join("/") + "_Compiled"
    end
    Dir.mkdir(@output_folder_path) unless Dir.exist?(@output_folder_path)
  end

  def analyze
    @input_file_paths.each do |path|
      analyze_file(path)
    end
  end

  private

  def analyze_file(path)
    tokenizer = JackTokenizer.new(path)
    # XxxT.xml, where T stands for tokenized output
    output_file = File.open(
      @output_folder_path + "/" + path.split("/").last.gsub(".jack", "T.xml"), "w"
    )

    output_file.puts "<tokens>"

    while tokenizer.has_more_tokens?
      tokenizer.advance

      case tokenizer.token_type
      when "SYMBOL"
        output_file.puts "<symbol> #{xml_escape(tokenizer.symbol)} </symbol>"
      when "KEYWORD"
        output_file.puts "<keyword> #{tokenizer.keyword.downcase} </keyword>"
      when "STRING_CONST"
        output_file.puts "<stringConstant> #{xml_escape(tokenizer.string_val)} </stringConstant>"
      when "INT_CONST"
        output_file.puts "<integerConstant> #{tokenizer.int_val} </integerConstant>"
      when "IDENTIFIER"
        output_file.puts "<identifier> #{tokenizer.identifier} </identifier>"
      end
    end

    output_file.puts "</tokens>"
  end

  def xml_escape(string)
    string
      .encode(xml: :text) # handles <, > and & encoding
      .gsub("\"", "&quot;") # handles double quote encoding
  end
end

JackAnalyzer.new(ARGV[0]).analyze
