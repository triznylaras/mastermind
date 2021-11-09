# frozen_string_literal: true

require_relative 'text_content'
require_relative 'display'

module Mastermind
  # Class for solving 'master code' from computer (code breaker mode)
  class HumanSolver
    include TextContent
    include Display
    include GameLogic

    attr_reader :computer_code, :guess, :exact_number, :same_number

    def initialize(code_type)
      @code_type = code_type
      random_numbers = generate_code(code_type)
      @computer_code = random_numbers.map(&:to_s)
    end

    def generate_code(code_type)
      case code_type.to_s
      when '2'
        [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
      when '1'
        (1..6).to_a.sample(4)
      end
    end

    def player_turns
      puts turn_message('breaker_start')
      turn_order
      human_game_over(computer_code, guess)
    end

    def turn_order
      turn = 1
      while turn <= 12
        turn_messages(turn)
        @guess = player_input.split(//)
        turn += 1

        break if guess[0].downcase == 'q'

        show_code(guess)
        break if solved?(computer_code, guess)

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

      puts warning_message('')
      player_input
    end

    def human_game_over(master, guess)
      if solved?(master, guess)
        puts game_message('human_won')
      else
        puts warning_message('game_over')
        puts game_message('display_code')
        show_code(master)
      end
      repeat_game
    end
  end
end
