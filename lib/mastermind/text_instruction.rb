module TextInstruction
  def instruction
    <<~HEREDOC
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
  end
end