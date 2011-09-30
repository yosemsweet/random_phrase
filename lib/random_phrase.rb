require "random_phrase/version"

module RandomPhrase

	def self.phrase(word_count = 1)
		phrase = []
		word_count.times do 
			phrase << RandomPhrase::Dictionary.words.pick
		end
		phrase.join(" ")
	end
	
	
		

end
