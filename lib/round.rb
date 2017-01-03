require_relative 'guess.rb'
require_relative 'deck.rb'

class Round
	attr_reader :deck, :guesses

	def initialize(deck)
		@deck = deck
		@guesses = []
	end

	def current_card
		deck.cards[guesses.count]
	end

	def record_guess(guess)
		guesses << Guess.new(guess,current_card)
	end

	def number_correct
		correct = [] 
		guesses.each {|guess| if guess.correct?; correct << guess end}
		@number_correct = correct.count
	end

	def percent_correct
		number_correct.to_f / guesses.count.to_f * 100
	end

	def start
		puts "Welcome to Flashcards!! You're playing with #{deck.count} cards."
		puts "---------------------------------------------------------------"
		until current_card == nil
			puts "You're on card #{(guesses.count) + 1} of #{deck.count}"
			puts current_card.question
			answer = gets.chomp
			record_guess(answer)
			puts guesses[(guesses.count - 1)].feedback
		end
		puts "********GAME_OVER********"
		puts "You got #{number_correct} out of #{deck.count} for a score of #{self.percent_correct}%."
	end
end