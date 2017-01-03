require 'minitest/autorun'
require 'minitest/pride'
require './lib/cardgenerator.rb'

class CardGeneratorTest < MiniTest::Test

	def test_it_is_a_card_generator
		filename = "cards.txt"
		decker = CardGenerator.new(filename)
		assert_equal CardGenerator, decker.class
	end

	def test_card_generator_generates_an_array_of_card_objects
		filename = "cards.txt"
		decker = CardGenerator.new(filename)
		assert_equal Array, decker.cards.class
		assert_equal 4, decker.cards.count
		assert_equal Card, decker.cards[0].class
		assert_equal Card, decker.cards[1].class
		assert_equal Card, decker.cards[2].class
		assert_equal Card, decker.cards[3].class
	end

end