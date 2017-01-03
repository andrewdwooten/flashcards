require 'minitest/autorun'
require 'minitest/pride'
require './lib/round.rb'
require './lib/card.rb'
require './lib/deck.rb'
require 'pry'

class RoundTest < MiniTest::Test
attr_reader :card_1, :card_2, :deck, :round
def setup
	@card_1 = Card.new("What is the capital of Alaska?", "Juneau")
	@card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
	@deck = Deck.new([card_1, card_2])
	@round = Round.new(deck)
end

	def test_a_round_has_a_deck
		assert_equal deck, round.deck
	end

	def test_a_round_starts_with_no_guesses
		assert_equal [], round.guesses
	end

	def test_round_starts_at_beginning_of_deck
		assert_equal card_1, round.current_card
	end

	def test_round_can_accept_and_count_guess
		round.record_guess("Juneau")
		assert_equal 1, round.guesses.count
	end

	def test_round_provides_feedback_for_correct_guesses
		round.record_guess("Juneau")
		assert_equal "Correct!", round.guesses.first.feedback
	end

	def test_round_records_number_of_correct_guesses
		round.record_guess("Juneau")
		assert_equal 1, round.number_correct
	end

	def test_round_changes_cards_after_guess
		round.record_guess("Juneau")
		assert_equal card_2, round.current_card
	end

	def test_round_tracks_multiple_guesses_and_counts_them
		round.record_guess("Juneau")
		round.record_guess("2")
		assert_equal 2, round.guesses.count
	end

	def test_round_provides_feedback_for_incorrect_answer
		round.record_guess("Juneau")
		round.record_guess("2")
		assert_equal "Incorrect.", round.guesses.last.feedback
	end

	def test_round_will_summarize_statistics
		round.record_guess("Juneau")
		round.record_guess("2")
		assert_equal 1, round.number_correct
		assert_equal 50, round.percent_correct
	end
end