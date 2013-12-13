require 'spec_helper'

describe "User Pages" do
  subject {page}

  describe "index" do
    let(:user) {FactoryGirl.create(:user)}

    before(:each) do
      sign_in user
      visit users_path
    end

    it {should have_selector('title', text: "All users")}
    it {should have_selector('h1', text: "All users")}

  end

  describe "pagination" do
    before(:all) {30.times {FactoryGirl.create(:user) } }
    after(:all) {User.delete_all}
    it {should have_selector('div.pagination') }

    it "should list each user" do
      User.paginate(page: 1).each do |user|
        page.should have_selector('td', text: user.name)
      end
    end
  end
  
   

    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:user, name: "Sue", email: "sue@example.com")
      visit users_path
    end

    it {should have_selector('title', text: "All users")}
    it {should have_selector('h1', text: "All users")}
    it "should put each user in a table to show  each user" do
      User.all.each do |user|
        page.should have_selector('td', text: user.name)
      end
    end


  describe "profile page" do
   let(:user) {FactoryGirl.create(:user)}
   before {visit user_path(user)}

   it { should have_selector('h1', text: user.name)} 
   it { should have_selector('title', text: user.name)} 
  end

  describe "signup page" do
    before {visit signup_path}
    it {should have_selector('h1', text: "Sign Up") }
    it {should have_selector('title', text: full_title('Sign Up')) }
  end

  describe "sign up" do
    before { visit signup_path }
    
    let(:submit) {"Create my account"}
    
    describe "with invalid information" do
      it "Should not create a user" do
        expect { click_button submit}.not_to change(User, :count) 
      end
    end
    
  describe "with valid information " do
    before do
      fill_in "Name", with: "Example User2"
      fill_in "Email", with: "user1@example.com"
      fill_in "Password", with: "foobar"
      fill_in "Password confirmation", with: "foobar"
    end
        it "should create a user" do
         expect {click_button submit}.to change(User, :count).by(1)
        end
      describe "after saving the user" do
        before {click_button submit}
        it {should have_link('Sign out')}
      end 
    end
  end

  describe "edit" do
    let(:user) {FactoryGirl.create(:user)}
    before { visit edit_user_path(user) }


    describe "with valid information" do
      let(:new_name) {"New Name"}
      before do
       sign_in user
       visit edit_user_path(user)
      end
      let(:new_email) {"newexample@example.com"}
      before do
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirm password", with: user.password
        click_button "Save changes"
      end
      it {should have_selector('title', text: new_name)}
      it {should have_selector('div.alert.alert-success')}
      it {should have_link('Sign out', href: signout_path)}
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email}
    end
  end
end
