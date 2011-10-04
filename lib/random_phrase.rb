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

		def phrase(word_count = 1, *args)
			options = args.extract_options!
			phrase = []
			word_count.times do 
				phrase << dictionary.words(options).sample
			end
			phrase.join(" ")
		end
	end

end
