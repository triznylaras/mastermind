# frozen_string_literal: true

# Module for content text message
module TextContent
  def formatting(description, string)
    {
      'underline' => "\e[4;1m#{string}\e[0m",
      'red' => "\e[31;1m#{string}\e[0m"
    }[description]
  end

  def turn_message(message, number = nil)
    {
      'guess_prompt' => "Turn ##{number}: Type in four numbers (1-6) to guess code, or 'q' to quit game.",
      'breaker_start' => "The computer has set the 'master code' and now it's time for you to break the code.\n\n",
      'code_prompt' => "Please enter a 4-digit 'master code' for the computer to break.",
      'code_displayed' => "is your 'master code'.\n"
    }[message]
  end

  def game_message(message)
    {
      'choose' => 'Please choose 1 or 2!',
      'allow_duplicate' => "Would you like to allow duplicate numbers in the code?\nPress '1' to NOT allow duplicates\nPress '2' to allow duplicates",
      'human_won' => "  You broke the code! Congratulations, you win! \n\n",
      'display_code' => 'Here is the master code that you were trying to break:',
      'computer_lost' => "\nYou out-smarted the computer & won the game!",
      'repeat_prompt' => "\n\nDo you want to play again? Press 'y' for yes (or any other key for no).",
      'thanks' => 'Thank you for playing Mastermind!'
    }[message]
  end

  def computer_won_message(message)
    {
      'inconceivable' => "\nInconceivable! Either your code only had 1-2 different numbers or the computer's randomized numbers just happened to be in a perfect order.",
      'won' => "\nGame over. The computer broke your code.",
      'close' => "\nThat was close, but the computer finally broke your code."
    }[message]
  end

  def warning_message(message)
    {
      'last_turn' => formatting('red', 'Choose carefully. This is your last chance to win!').to_s,
      'answer_error' => formatting('red', "Enter '1' to be the code MAKER or '2' to be the code BREAKER.").to_s,
      'code_error' => formatting('red', "Your 'master code' must be 4 digits long, using numbers between 1-6.").to_s,
      'game_over' => formatting('red', "Game over. That was a hard code to break!\n\n")
    }[message]
  end
end
