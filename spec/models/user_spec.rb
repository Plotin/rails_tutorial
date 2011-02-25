require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Example User", 
              :email => "test@test.de", 
              :password => "test",
              :password_confirmation => "test"
            }
    @user = User.create!(@attr)
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

  it "should fail without a password" do
    failingUser = User.new(@attr.merge(:password => ""))
    failingUser.should_not be_valid
  end

  it "should fail without a password_confirmation" do
    failingUser = User.new(@attr.merge(:password_confirmation => ""))
    failingUser.should_not be_valid
  end

  it "should fail if password doesn't match password_confirmation" do
    failingUser = User.new(@attr.merge(:password_confirmation => "123"))
    failingUser.should_not be_valid
  end
  
  it "should reject long passwords" do
    pw = "a" * 10
    failing_user = User.new(@attr.merge(:password => pw, :password_confirmation => pw))
  end

  it "should reject short passwords" do
    pw = "a" * 3
    failing_user = User.new(@attr.merge(:password => pw, :password_confirmation => pw))
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    failing_user = User.new(@attr.merge(:name => long_name))
    failing_user.should_not be_valid  
  end
  
  it "should respond to encrypted_password" do
    @user.should respond_to(:encrypted_password)      
  end
  
  it "should not be blank" do
    @user.encrypted_password.should_not be_blank
  end
  
  describe "has_password? method" do
    it "should be true if passwords match" do
      @user.has_password?(@attr[:password]).should be_true
    end
    it "should be false if passwords don't match" do
      @user.has_password?("invalid").should be_false
    end
  end
  
  describe "authenticate" do
    it "should not authenticate with wrong password" do
      u = User.authenticate(@attr[:email],"xxx")
      u.should be_nil
    end
    
    it "should not authenticate with wrong email" do
      u = User.authenticate("xxx", @attr[:password])
      u.should be_nil
    end
    
    it "should authenticate" do
      u = User.authenticate(@attr[:email],@attr[:password])
      u.should == @user
    end
    
  end
end
