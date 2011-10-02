require "random_phrase/version"
require "random_phrase/dictionary"

module RandomPhrase

	class << self
		def dictionary=(dictionary)
			@@dictionary = dictionary
		end

		def dictionary
			@@dictionary ||= RandomPhrase::Dictionary.new
		end

		def phrase(word_count = 1)
			phrase = []
			word_count.times do 
				phrase << dictionary.words.sample
			end
			phrase.join(" ")
		end
	end

end
