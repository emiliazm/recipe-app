require 'rails_helper'

RSpec.describe 'Shopping List  index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Axel', email: 'axel@gmail2.com')
    sign_in(@user)
    @user.confirm
    @food1 = Food.create(name: 'food1', measurement_unit: 'kg', price: 10, quantity: 8, user_id: @user.id)
    @food2 = Food.create(name: 'food2', measurement_unit: 'kg', price: 1, quantity: 7, user_id: @user.id)
    @food3 = Food.create(name: 'food3', measurement_unit: 'kg', price: 2, quantity: 80, user_id: @user.id)
    @food4 = Food.create(name: 'food4', measurement_unit: 'mts', price: 11, quantity: 1, user_id: @user.id)
    @food5 = Food.create(name: 'food5', measurement_unit: 'lt', price: 100, quantity: 100, user_id: @user.id)
    @food6 = Food.create(name: 'food6', measurement_unit: 'kg', price: 56.87, quantity: 51, user_id: @user.id)
    @recipe1 = Recipe.create(user_id: @user.id, name: 'Recipe 1', preparion_time: 1000, cooking_time: 8,
                             description: 'Desc1', public: true)
    @recipe2 = Recipe.create(user_id: @user.id, name: 'Recipe 2', preparion_time: 5, cooking_time: 67,
                             description: 'Desc2', public: true)
    visit user_shopping_lists_path(@user.id)
  end

  it 'recipe details' do
    expect(page).to have_content('Amount of food / items to buy: 6')
    expect(page).to have_content('Total value of food:')
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
  end
end
