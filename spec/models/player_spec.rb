require 'spec_helper'

describe Player do
    
  context "input parser" do
    before(:all) do
      @valid_data  = 'foo@example.com|john.989'      
      @valid_email = 'foo@example.com'
      @valid_name  = 'john.989'
      
      @invalid_data = 'foo@example.com|john 989'
    end
    
    it "should return a valid player on valid data" do
      player = Player.from_data(@valid_data)
      player.should be_valid
    end
    
    it "should parse player data in given format" do
      player = Player.new
      player.send(:parse_data, @valid_data)
      player.email.should == @valid_email
      player.name.should == @valid_name
      player.should be_valid
    end
    
    it "should reject invalid data" do
      player = Player.from_data(@invalid_data)
      player.should_not be_valid
    end
  end
end
