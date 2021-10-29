module Mastermind
  class Game
    def play
      @show = Display.new("instruction")
      puts @show.instruction
      game_mode = mode_selection
      code_type = code_selection
      code_maker if game_mode == '1' && !code_type.nil?
      code_breaker(code_type) if game_mode == '2' && !code_type.nil?
    end

    def mode_selection
      input = gets.chomp
      return input if input.match(/^[1-2]$/)

      puts("Please choose 1 or 2!")
      mode_selection
    end

    # def code_maker
      
    # end
    
    def code_selection
      puts("Would you like to allow duplicate numbers in the code?")
      puts("Press '1' to NOT allow duplicates\nPress '2' to allow duplicates")
      code_type = gets.chomp
      return code_type if code_type.match(/^[1-2]$/)

      puts("Please choose 1 or 2!")
      code_selection
    end

    def code_breaker(code_type)
      breaker = HumanSolver.new(code_type)
      breaker.player_turns
    end
  end
end
