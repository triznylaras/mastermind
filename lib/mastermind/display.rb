module Display
  def formatting(description, string)
    @text_formatting = {
      'underline' => "\e[4;1m#{string}\e[0m",
      'red' => "\e[31;1m#{string}\e[0m"
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
end
