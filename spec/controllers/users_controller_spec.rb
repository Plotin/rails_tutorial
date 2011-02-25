require 'spec_helper'

describe UsersController do
  render_views
  
  describe "POST new" do
    describe "failure" do
      before(:each) do
        @attr = { :name => "", :email => "", :password => "", :password_confirmation => "" }
      end
    
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end
      it "should have the right title" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
  end
  
  describe "success" do
    before(:each) do
      @attr = { :name => "Steffen Schoenwiese", :email => "test@plotin.de", :password => "test1", :password_confirmation => "test1" }
    end
    
    it "should create a user" do
      lambda do
        post :create, :user => @attr
      end.should change(User, :count)
    end
    
    it "should redirect" do
      post :create, :user => @attr
      response.should redirect_to(user_path(assigns(:user))) 
    end
    
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Sign up")
    end
  end
  describe "GET show" do
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should be the correct user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end
    
    it "should have the users name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end
    
    it "should have an image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end
end
