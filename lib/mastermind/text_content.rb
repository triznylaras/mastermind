module Mastermind
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
        'code_prompt' => "Please enter a 4-digit 'master code' for the computer to break."
      }[message]
    end

    def game_message(message)
      {
        'choose' => 'Please choose 1 or 2!',
        'allow_duplicate' => "Would you like to allow duplicate numbers in the code?\nPress '1' to NOT allow duplicates\nPress '2' to allow duplicates",
        'human_won' => "  You broke the code! Congratulations, you win! \n\n",
        'display_code' => 'Here is the master code that you were trying to break:',
        'repeat_prompt' => "\n\nDo you want to play again? Press 'y' for yes (or any other key for no).",
        'thanks' => 'Thank you for playing Mastermind!'
      }[message]
    end

    def warning_message(message)
      {
        'last_turn' => formatting('red', 'Choose carefully. This is your last chance to win!').to_s,
        'game_over' => formatting('red', 'Game over. That was a hard code to break!\n\n')
      }[message]
    end
  end
end
