require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'

class CardTest < MiniTest::Test

	def test_is_it_a_card
		card = Card.new("What is the capital of Alaska?", "Juneau")
		assert_equal Card, card.class
	end

	def test_card_holds_a_question
		card = Card.new("What is the capital of Alaska?", "Juneau")
		assert_equal "What is the capital of Alaska?", card.question
	end

	def test_card_holds_a_answer
		card = Card.new("What is the capital of Alaska?", "Juneau")
		assert_equal "Juneau", card.answer
	end
end