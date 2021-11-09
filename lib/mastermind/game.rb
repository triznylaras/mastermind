# frozen_string_literal: true

require_relative 'text_content'
require_relative 'text_instruction'
require_relative 'display'

module Mastermind
  # Class for set up the game
  class Game
    include Display
    include TextContent
    include TextInstruction

    def play
      puts instruction
      game_mode = mode_selection
      enter_mode(game_mode)
    end

    def enter_mode(game_mode)
      case game_mode
      when '1'
        code_maker
      when '2'
        code_type = code_selection
        code_breaker(code_type)
      else
        puts warning_message('answer error')
      end
    end

    def mode_selection
      input = gets.chomp
      return input if input.match(/^[1-2]$/)

      puts game_message('choose')
      mode_selection
    end

    def code_maker
      maker = ComputerSolver.new
      maker.computer_start
    end

    def code_selection
      puts game_message('allow_duplicate')
      code_type = gets.chomp
      return code_type if code_type.match(/^[1-2]$/)

      puts game_message('choose')
      code_selection
    end

    def code_breaker(code_type)
      breaker = HumanSolver.new(code_type)
      breaker.player_turns
    end
  end
end
