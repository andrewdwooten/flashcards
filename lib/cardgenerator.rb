require './lib/card.rb'

class CardGenerator
	attr_reader :cards
	
	def initialize(filename)
		@cards = []
		File.readlines(filename).each do |line|
		contents = line.partition(',');
		cards << Card.new(contents[0],contents[2].chomp) end
	end
end
