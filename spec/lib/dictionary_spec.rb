require "spec_helper"

describe RandomPhrase::Dictionary do
	context "class methods" do
		
		context "::new" do
			it "returns a dictionary object" do
				RandomPhrase::Dictionary.new.should be_kind_of(RandomPhrase::Dictionary)
			end

			it "can be passed a block that defines the implementation of #load" do
				load_static = Proc.new { ["a","b","c","d"]}
				RandomPhrase::Dictionary.new(load_static).words.should == ["a","b","c","d"]
			end
		end
	end
	
	context "object methods" do	
		context "#words" do
			it "should respond to words" do
				RandomPhrase::Dictionary.new.should respond_to(:words)
			end
			
			it "should return an array" do
				RandomPhrase::Dictionary.new.words.should be_kind_of(Array)
			end
			
			it "should accept optional arguments" do
				RandomPhrase::Dictionary.new.words.should be_kind_of(Array)
				RandomPhrase::Dictionary.new.words(:length => 3).should be_kind_of(Array)
				RandomPhrase::Dictionary.new.words(:length => 3, :pattern => /abc/).should be_kind_of(Array)
			end
			
			context "passing in length" do
				it "should return only words with length characters" do
					dictionary = RandomPhrase::Dictionary.new(Proc.new {["a", "a"*2, "a"*3, "a"*4, "a"]})
					dictionary.words(:length => 1).each { |w| w.length.should == 1}
					dictionary.words(:length => 2).each { |w| w.length.should == 2}
					dictionary.words(:length => 3).each { |w| w.length.should == 3}
					dictionary.words(:length => 4).each { |w| w.length.should == 4}
					
					dictionary.words(:length => 1).length.should == 2
					dictionary.words(:length => 2).length.should == 1
					dictionary.words(:length => 3).length.should == 1
					dictionary.words(:length => 4).length.should == 1
				end
			end
		end
	end
end