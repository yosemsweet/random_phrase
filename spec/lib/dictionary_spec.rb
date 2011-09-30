require "spec_helper"

describe RandomPhrase::Dictionary do
	context "module methods" do
		context "::load" do
			it "should respond to load" do
				RandomPhrase::Dictionary.should respond_to(:load)
			end
		end
		
		context "::word" do
			it "should respond to words" do
				RandomPhrase::Dictionary.should respond_to(:words)
			end
			
			it "should return an array" do
				RandomPhrase::Dictionary.words.should be_kind_of(Array)
			end
		end
	end
end