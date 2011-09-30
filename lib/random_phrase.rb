require "random_phrase/version"
require "random_phrase/dictionary"
require "random_phrase/core_ext/array"

module RandomPhrase

	def self.phrase(word_count = 1)
		phrase = []
		word_count.times do 
			phrase << RandomPhrase::Dictionary.words.pick
		end
		phrase.join(" ")
	end

end
