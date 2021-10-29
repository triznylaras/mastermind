module Mastermind
  class TextContent
    def turn_message(message, number = nil)
      {
        'guess_prompt' => "Turn ##{number}: Type in four numbers (1-6) to guess code, or 'q' to quit game.",
        'breaker_start' => "The computer has set the 'master code' and now it's time for you to break the code.\n\n",
      }[message]
    end
  end
end