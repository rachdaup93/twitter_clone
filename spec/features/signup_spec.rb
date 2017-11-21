require "rails_helper"

RSpec.feature "Sign Up", :type => :feature do
  scenario "User sign up successfully" do
    visit "/signup"

    fill_in "user_full_name", :with => "Bob Smith"
    fill_in "user_email", :with => "test@test.com"
    fill_in "user_password", :with => "1234asdf"
    click_button "sign-up"

    current_path.should == "/login"
    find('.notice').should have_content('User was saved successfully.')
  end
  scenario "User sign up without password" do
    visit "/signup"

    fill_in "user_full_name", :with => "Bob Smith"
    fill_in "user_email", :with => "test@test.com"
    click_button "sign-up"

    current_path.should == "/signup"
    find('.error').should have_content('Please fill out all the fields.')
  end

  scenario "User sign up without full name" do
    visit "/signup"

    fill_in "user_email", :with => "test@test.com"
    fill_in "user_password", :with => "1234asdf"
    click_button "sign-up"

    current_path.should == "/signup"
    find('.error').should have_content('Please fill out all the fields.')
  end

  scenario "User sign up without email" do
    visit "/signup"

    fill_in "user_full_name", :with => "Bob Smith"
    fill_in "user_password", :with => "1234asdf"
    click_button "sign-up"

    current_path.should == "/signup"
    find('.error').should have_content('Please fill out all the fields.')
  end
  scenario "User sign up without password" do
    visit "/signup"

    fill_in "user_full_name", :with => "Bob Smith"
    fill_in "user_email", :with => "test@test.com"
    click_button "sign-up"

    current_path.should == "/signup"
    find('.error').should have_content('Please fill out all the fields.')
  end
end