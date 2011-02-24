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
  
  it "should navigate" do
    visit root_path
    response.should have_selector("title", :content => "Home")
    click_link "About"
    response.should have_selector("title", :content => "About")
    click_link "Contact"
    response.should have_selector("title", :content => "Contact")
    click_link "Home"
    response.should have_selector("title", :content => "Home")    
    click_link "Sign up now"
    response.should have_selector("title", :content => "Sign up")
  end
end
