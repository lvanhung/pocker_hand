class Card 
	SUITS = %w{C D H S}
	RANKS = %w{ 2 3 4 5 6 7 8 9 T J Q K A }
	attr_reader :suit, :rank 
	def initialize(playing_card)
		@playing_card = playing_card
		@suit, @rank = playing_card.split(//)
	    raise ArgumentError, "card #{@suit}#{@rank} is invalid" unless is_valid_card?
	end

	def is_valid_card?
		(SUITS.include? @suit) && (RANKS.include? @rank)
	end
end

