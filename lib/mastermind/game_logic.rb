# frozen_string_literal: true

module Mastermind
  # Class to process the logic of the game
  module GameLogic
    def compare(master, guess)
      cont_master = master.clone
      cont_guess = guess.clone

      @exact_number = exact_matches(cont_master, cont_guess)
      @same_number = same_numbers(cont_master, cont_guess)
      @total_number = exact_number + same_number
    end

    def exact_matches(master, guess)
      exact = 0
      master.each_with_index do |number, index|
        next unless number == guess[index]

        exact += 1
        master[index] = '*'
        guess[index] = '*'
      end
      exact
    end

    def same_numbers(master, guess)
      same = 0
      guess.each_index do |index|
        next unless master.include?(guess[index]) && guess[index] != '*'

        same += 1
        master[index] = '?'
        guess[index] = '?'
      end
      same
    end

    def solved?(master, guess)
      master == guess
    end

    def repeat_game
      puts game_message('repeat_prompt')
      replay = gets.chomp
      puts game_message('thanks') if replay.downcase != 'y'
      Game.new.play if replay.downcase == 'y'
    end
  end
end
