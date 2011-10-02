require "spec_helper"

describe RandomPhrase do
	context "::phrase" do
		it "should respond to phrase an optional word count" do
			RandomPhrase.should respond_to(:phrase)
			RandomPhrase.should respond_to(:phrase).with(1)
		end
		
		it "should return a string" do
			RandomPhrase.phrase.should be_kind_of(String)
		end
		
		it "should default to 1 word" do
			RandomPhrase.phrase.split.count.should == 1
		end
		
		it "should return as many words as are asked for" do
			RandomPhrase.phrase(2).split.count.should == 2
			RandomPhrase.phrase(3).split.count.should == 3
			RandomPhrase.phrase(10).split.count.should == 10
		end
		
		it "should return different phrases on successive calls" do
			RandomPhrase.phrase.should_not == RandomPhrase.phrase
		end
	end
	
	context "::dictionary" do
		it "should have a dictionary accessor attribute" do
			RandomPhrase.should respond_to(:dictionary=)
			RandomPhrase.should respond_to(:dictionary)
		end
		
		it "should only return words from its dictionary" do
			dictionary = RandomPhrase::Dictionary.new(Proc.new {["a", "b", "c"]})
			RandomPhrase.dictionary= dictionary
			RandomPhrase.phrase(10).split.each { |word| dictionary.words.should include(word) }
		end
	end
end