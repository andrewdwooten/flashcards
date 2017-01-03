require './lib/round.rb'
require './lib/cardgenerator.rb'
require './lib/deck.rb'


deck_builder = CardGenerator.new("cards.txt")
deck = Deck.new(deck_builder.cards)
round = Round.new(deck)

round.start
