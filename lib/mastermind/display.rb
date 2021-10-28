module Mastermind
  class Display
    def initialize(name)
      @name = name
    end

    def formatting(description, string)
      @text_formatting = {
        "underline" => "\e[4;1m#{string}\e[0m",
        "red" => "\e[31;1m#{string}\e[0m"
      }
      @text_formatting[description]
    end

    def instruction
      @instruction_text = <<~HEREDOC
        #{formatting("underline", "Welcome to Mastermind Game!")}
      HEREDOC
      @instruction_text
    end
  end
end