require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do


  # SETUP
  before :each do
    @user = User.create!( 
    name: "Wanjin",
    email: "dksladjsla@gmail.com",
    password: "12345",
    password_confirmation: "12345"
    )
  end


  scenario "Successfully Login a User" do
    # ACT
    visit root_path
    find_link('Login').click
    fill_in 'email', with: "dksladjsla@gmail.com"
    fill_in 'password', with: "12345"
    find_button('Submit').click
    expect(page).to have_content "Logout"    
  end
end