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

		def phrase(*args)
			options = args.extract_options!
			word_patterns = []
			
			unless args.empty?
				if args.first.respond_to?(:times)
					word_count = args.first
				elsif args.first.kind_of?(Regexp)
					word_patterns = args.first.source.split(/(?:\s|\\\\s)/)
					word_count = word_patterns.count
				elsif args.first.respond_to?(:to_s)
					word_count = args.first.to_s.split(/\s/).count
				end
			end
			
			word_count ||= 1
			phrase = []
			word_count.times do |i|
				options.merge!(:pattern => Regexp.compile(word_patterns[i])) unless word_patterns.empty?
				phrase << dictionary.words(options).sample
			end
			phrase.join(" ")
		end
	end

end
