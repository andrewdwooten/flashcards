require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck.rb'

class DeckTest < MiniTest::Test
attr_reader :card_1, :card_2, :card_3, :deck
def setup
	@card_1 = Card.new("What is the capital of Alaska?", "Juneau")
	@card_2 = Card.new("Which planet is closest to the sun?", "Mercury")
	@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
	@deck = Deck.new([card_1, card_2, card_3])
end

	def test_is_it_a_deck
		assert_equal Deck, deck.class
	end

	def test_the_deck_holds_cards
		assert_equal [card_1, card_2, card_3], deck.cards
	end

	def test_the_deck_knows_how_many_cards_it_contains
		assert_equal 3, deck.count
	end
end