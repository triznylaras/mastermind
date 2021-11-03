module Mastermind
  class Game
    include TextContent
    include Display

    def play
      puts instruction
      game_mode = mode_selection
      code_type = code_selection
      code_maker if game_mode == '1'
      code_breaker(code_type) if game_mode == '2' && !code_type.nil?
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
