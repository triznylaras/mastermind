module Mastermind
  class Game
    def play
      @show = Display.new("show")
      puts @show.instruction
    end
  end
end