require "spec_helper"

describe Array do
	context "#pick" do
		it "should respond to pick" do
			[].should respond_to(:pick)
		end
		
		it "should return a random element" do
			a = [1,2,3,4,5,6,7,8,9,10]
			a.pick.should_not == a.pick
			a.find_index(a.pick).should_not be_nil
		end
	end		
end