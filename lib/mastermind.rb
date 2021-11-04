# frozen_string_literal: true

require_relative 'mastermind/version'

module Mastermind
  class Error < StandardError; end
  # Your code goes here...
end

require_relative 'mastermind/display'
require_relative 'mastermind/game'
require_relative 'mastermind/game_logic'
require_relative 'mastermind/text_content'
require_relative 'mastermind/human_solver'
require_relative 'mastermind/computer_solver'
