module Mastermind
  class HumanSolver
    include TextContent

    def initialize(code_type)
      random_numbers = []
      if code_type == 1
        random_numbers = (1..6).to_a.sample(4)
      elsif code_type == 2
        random_numbers = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
      end
      @code_type = code_type
      @computer_code = random_numbers.map(&:to_s)
    end

    def player_turns
      puts turn_message('breaker_start')
      
    end
  end
end