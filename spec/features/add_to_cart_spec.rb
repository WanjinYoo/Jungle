require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do


  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "add an item to their cart" do
    # ACT
    visit root_path

    first("article.product").find_button('Add').click
    find_link('My Cart (1)').click # takes time
    expect(page).to have_content "TOTAL:"     
  end

end