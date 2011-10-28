require "active_support/core_ext/array/extract_options"

class RandomPhrase::Dictionary
	attr_accessor :loader
	
	module DefaultLoader
	  def self.load
	    if File.exists?("config/words")
				File.read("config/words").split
			else
				"flowing river down brightly sparkling in the sun may I dip my toes".split
			end
	  end		
	end
	
	def initialize(loader = nil)
		loader = Proc.new {loader} unless loader.nil? || loader.kind_of?(Proc)
		self.loader = loader ||= Proc.new { DefaultLoader.load }
	end
	

	def words(*args)
		options = args.extract_options!
	
		@dictionary ||= loader.call().group_by {|word| word.length}
		result = @dictionary.values.flatten
		if options.key?(:length)
			result = @dictionary.fetch(options[:length], [])
		end
		
		if options.key?(:pattern)
			result = result.select { |w| w =~ Regexp.try_convert(options[:pattern]) }
		end
		
		result.flatten
	end

end
