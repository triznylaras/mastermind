# require_relative './mastermind/text_content.rb'

module Mastermind
  class HumanSolver
    include TextContent

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
        @guess = player_input.split(//)
        turn += 1

        break if guess[0].downcase == 'q'
      end
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
