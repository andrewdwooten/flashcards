require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess.rb'

class GuessTest < MiniTest::Test

	def test_guess_holds_a_card
		card = Card.new("What is the capital of Alaska?", "Juneau")
		guess = Guess.new("Juneau", card)
		assert_equal card, guess.card
	end

	def test_guess_holds_inputted_response
		card = Card.new("What is the capital of Alaska?", "Juneau")
		guess = Guess.new("Juneau", card)
		assert_equal "Juneau", guess.response
	end

	def test_guess_knows_right_answer
		card = Card.new("What is the capital of Alaska?", "Juneau")
		guess = Guess.new("Juneau", card)
		assert guess.correct?
	end

	def test_guess_provides_appropriate_feedback_for_right_answer
		card = Card.new("What is the capital of Alaska?", "Juneau")
		guess = Guess.new("Juneau", card)
		assert_equal "Correct!", guess.feedback
	end

	def test_guess_knows_answer_not_correct
		card_2 = Card.new("Which planet is closest to the sun?", "Mercury")
		guess_2 = Guess.new("Saturn", card_2)
		refute guess_2.correct?
	end

	def test_guess_provides_appropriate_feedback_for_wrong_answer
		card_2 = Card.new("Which planet is closest to the sun?", "Mercury")
		guess_2 = Guess.new("Saturn", card_2)
		assert_equal "Incorrect.", guess_2.feedback
	end
end
