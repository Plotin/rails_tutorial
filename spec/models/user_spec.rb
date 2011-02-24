require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Example User", :email => "test@test.de" }
  end
  
  it "should should create a new user" do
    User.create!(@attr)
  end
  
  it "should fail without a name" do
    failingUser = User.new(@attr.merge(:name => ""))
    failingUser.should_not be_valid
  end
  
  it "should fail without an email" do
    failingUser = User.new(@attr.merge(:email => ""))
    failingUser.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    failing_user = User.new(@attr.merge(:name => long_name))
    failing_user.should_not be_valid  
  end
end
