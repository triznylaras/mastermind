# frozen_string_literal: true

require_relative "mastermind/version"

module Mastermind
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "mastermind/display.rb"
require_relative "mastermind/game.rb"
require_relative "./mastermind/game_logic.rb"
require_relative "./content/text_content.rb"
require_relative "mastermind/human_solver.rb"
