require './card'
class PockerHand
	attr_reader :pocker_hand

	RULES = {
		four_cards: [1,4], 
		full_house: [2,3], 
		three_card: [1,1,3],
		two_pairs: [1,2,2],
		one_pair: [1,1,1,2]
	}

	def initialize(cards)
		cards = cards.gsub(/\s+/, "").upcase
		raise ArgumentError, "a pocker hand is only 5 cards" unless cards.length == 10
		@pocker_hand = cards.scan(/\S{2}/).map { |card| Card.new(card) }
		raise ArgumentError, "the pocker shouldn't have same cards" if is_duplicate_card_in_pocker_hand?
	end

	def type_pocker_hand
		case count_ranks_occurs_in_pocker_hand
		when RULES[:four_cards]
			p "4C - the pocker hand #{pocker_hand_input} is four cards"
		when RULES[:full_house]
			p "FH - the pocker hand #{pocker_hand_input} is full house" 
		when RULES[:three_card]
			p "3C - the pocker hand #{pocker_hand_input} is three cards" 
		when RULES[:two_pairs]
			p "2P - the pocker hand #{pocker_hand_input} is two pairs"
		when RULES[:one_pair] 
			p "1P - the pocker hand #{pocker_hand_input} is one pair"
		else
			p "-- "
		end		
	end

	def cards
		@pocker_hand.map { |card| "#{card.suit}#{card.rank}"  }
	end

	def ranks_a_pocker_hand
		@pocker_hand.map { |card| card.rank  }
	end

	def uniq_ranks_a_pocker_hand
		ranks_a_pocker_hand.uniq
	end

	def is_duplicate_card_in_pocker_hand?
		(cards.uniq.count == 5) ? false : true
	end

	def count_ranks_occurs_in_pocker_hand
		uniq_ranks_a_pocker_hand.map { |rank| ranks_a_pocker_hand.count(rank)  }.sort
	end

	def pocker_hand_input 
		cards.join('')
	end
end
# Add some examples for testing 
pocker = PockerHand.new('S3C3D3H3H4')
pocker.type_pocker_hand
pocker = PockerHand.new('S4C4D4HTCT')
pocker.type_pocker_hand
pocker = PockerHand.new('S2S3S4S5S6')
pocker.type_pocker_hand







