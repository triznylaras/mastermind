module Mastermind
  class HumanSolver
    include TextContent
    include Display
    include GameLogic

    attr_reader :computer_code, :guess, :exact_number, :same_number

    def initialize(code_type)
      random_numbers =
        case code_type
        when 1
          (1..6).to_a.sample(4)
        else
          [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
        end
      @code_type = code_type
      @computer_code = random_numbers.map(&:to_s)
    end

    def player_turns
      puts turn_message('breaker_start')
      turn_order
    end

    def turn_order
      turn = 1
      while turn <= 12
        turn_messages(turn)
        @guess = player_input.split(//)
        turn += 1

        break if guess[0].downcase == 'q'

        show_code(guess)

        turn_outcome
      end
    end

    def turn_messages(turn)
      puts turn_message('guess_prompt', turn)
      puts warning_message('last_turn') if turn == 12
    end

    def turn_outcome
      compare(computer_code, guess)
      show_clues(exact_number, same_number)
    end

    def player_input
      input = gets.chomp
      return input if input.match(/^[1-6]{4}$/)
      return input if input.downcase == 'q'

      puts("Error")
      player_input
    end
  end
end
