require 'spec_helper'

describe "Static Pages" do

  describe "Home Page" do
    it "should have the content 'Sample App'" do 
      visit '/static_pages/home'
      page.should have_selector('h1', text: "Sample App")
    end
    
    it "Should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                                      text: "Sample App | Home")
    end
  end

  describe "Help Page" do
    it "should have the h1 selector 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', text: "Help")
    end

    it "Should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title',
                                      text: "Sample App | Help")
    end
  end

  describe "About us  Page" do
    it "Should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: "About us")
    end

    it "Should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                                      text: "Sample App | About us")
    end
  end

  describe "Contact Page" do
    it "should have the content 'Contact'" do 
      visit '/static_pages/contact'
      page.should have_selector('h1', text: "Contact")
    end
    
    it "Should have the right title" do
      visit '/static_pages/contact'
      page.should have_selector('title',
                                      text: "Sample App | Contact")
    end
  end


end
