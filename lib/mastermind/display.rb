module Display
  def formatting(description, string)
    @text_formatting = {
      "underline" => "\e[4;1m#{string}\e[0m",
      "red" => "\e[31;1m#{string}\e[0m"
    }
    @text_formatting[description]
  end

  def color_code(number)
    {
      '1' => "\e[44m  1  \e[0m" " ",
      '2' => "\e[42m  2  \e[0m" " ",
      '3' => "\e[45m  3  \e[0m" " ",
      '4' => "\e[30;1m\e[46m  4  \e[0m" " ",
      '5' => "\e[30;1m\e[43m  5  \e[0m" " ",
      '6' => "\e[30;1m\e[41m  6  \e[0m" " "
    }[number]
  end

  def color_clue(clue)
    {
      '*' => "\e[32;1m\e[47m * \e[0m" " ",
      '?' => "\e[31m\e[47m ? \e[0m" " "
    }[clue]
  end

  def clues(exact, same)
    exact.times { print color_clue('*') }
    same.times { print color_clue('?') }
    puts ''
  end

  def show_code(array)
    array.each do |num|
      print color_code num
    end
  end

  def show_clues(exact, same)
    print ' Clues: '
    exact.times { print color_clue('*') }
    same.times { print color_clue('?') }
    puts ''
  end

  def instruction
    @instruction_text = <<~HEREDOC
      #{formatting("underline", "Welcome to Mastermind Game!")}
      This is a 1-player game against the computer. 
      You can choose to be the code #{formatting("underline", "maker")} or the code #{formatting("underline", "breaker")}.
      There are six different number/color combinations:
      
      #{color_code("1")}#{color_code("2")}#{color_code("3")}#{color_code("4")}#{color_code("5")}#{color_code("6")}
      
      
      The code maker will choose four to create a 'master code'. For example,
      #{color_code("1")}#{color_code("3")}#{color_code("4")}#{color_code("5")}
      
      You can choose #{formatting("red", "DUPLICATE")} or #{formatting("red", "NOT DUPLICATE")} number/color in one 'master code' from computer, if you are in BREAKER MODE.
      In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.
      
      
      #{formatting("underline", "Clues:")}
      After each guess, there will be up to four clues to help crack the code.
      
      #{color_clue("*")} This clue means you have 1 correct number in the correct location.
      
      #{color_clue("?")} This clue means you have 1 correct number, but in the wrong location.
      
      
      #{formatting("underline", "Clue Example:")}
      To continue the example, using the above 'master code' a guess of "1463" would produce 3 clues:
      
      #{color_code("1")}#{color_code("4")}#{color_code("6")}#{color_code("3")}  Clues: #{color_clue("*")}#{color_clue("?")}#{color_clue("?")}
      
      
      The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.
      
      #{formatting("underline", "It's time to play!")}
      Would you like to be the code MAKER or code BREAKER?
      Press '1' to be the code MAKER
      Press '2' to be the code BREAKER
    HEREDOC
    @instruction_text
  end
end
