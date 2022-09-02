require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
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
    visit user_foods_path(@user.id)
  end

  it 'all the content is rendering in the foods page' do
    expect(page).to have_content('New food')
  end

  it 'Link "New food"' do
    click_on 'New food'
    expect(page).to have_current_path new_user_food_path(@user.id)
  end

  it 'shoud have 6 food names' do
    expect(page).to have_content(@food1.name)
    expect(page).to have_content(@food2.name)
    expect(page).to have_content(@food3.name)
    expect(page).to have_content(@food4.name)
    expect(page).to have_content(@food5.name)
    expect(page).to have_content(@food6.name)
  end

  it 'delete food button' do
    expect(page).to have_selector(:link_or_button, 'Delete')
  end
end
