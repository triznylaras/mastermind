require_relative 'lib/mastermind'

Mastermind::TextContent.readlines "/tmp/x"
Mastermind::Game.new.play
