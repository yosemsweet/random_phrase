module RandomPhrase::Dictionary
  def self.load
    if File.exists?("config/words")
			File.read("config/words").split
		else
			"flowing hill".split
		end
  end

	def self.words
		@@dictionary ||= self.load
	end
	
end
