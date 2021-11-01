module TextContent
  def turn_message(message, number = nil)
    {
      'guess_prompt' => "Turn ##{number}: Type in four numbers (1-6) to guess code, or 'q' to quit game.",
      'breaker_start' => "The computer has set the 'master code' and now it's time for you to break the code.\n\n",
      'code_prompt' => "Please enter a 4-digit 'master code' for the computer to break."
    }[message]
  end

  def warning_message(message)
    {
      'last_turn' => formatting('red', 'Choose carefully. This is your last chance to win!').to_s
    }[message]
  end
end
