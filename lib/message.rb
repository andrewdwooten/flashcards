module Message

	def self.opening
		"Welcome to Flashcards!! You're playing with #{deck.count} cards."
	end

	def self.long_bar
		"---------------------------------------------------------------"
	end

	def self.progress
		"You're on card #{(self.guesses.count) + 1} of #{self.deck.count}"
	end

	def self.end_of_game
		"********GAME_OVER********"
	end

	def self.report
		"You got #{self.number_correct} out of #{self.deck.count} for a score of #{self.percent_correct}%."
	end
end
