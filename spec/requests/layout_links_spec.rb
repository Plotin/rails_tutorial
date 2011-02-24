require 'spec_helper'

describe "LayoutLinks" do
  it "should have '/'" do
    get '/'
    response.should have_selector("title", :content => "Home")
  end
  it "should have '/contact'" do
    get '/contact'
    response.should have_selector("title", :content => "Contact")
  end
  
  it "should have '/about'" do
    get '/about'
    response.should have_selector("title", :content => "About")
  end

  it "should have '/signup'" do
    get '/signup'
    response.should have_selector("title", :content => "Sign up")
  end
  
end
