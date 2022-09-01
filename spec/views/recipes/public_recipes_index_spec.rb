require 'rails_helper'

RSpec.describe 'Public Recipes index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Axel', email: 'axel@gmail2.com')
    sign_in(@user)
    @user.confirm
    @recipe1 = Recipe.create(user_id: @user.id, name: 'Recipe 1', preparion_time: 1000, cooking_time: 8,
                             description: 'Desc1', public: true)
    @recipe2 = Recipe.create(user_id: @user.id, name: 'Recipe 2', preparion_time: 5, cooking_time: 67,
                             description: 'Desc2', public: true)
    visit user_public_recipes_path(@user.id)
  end

  it 'recipes names' do
    expect(page).to have_content('Recipe 1')
    expect(page).to have_content('Recipe 2')
  end

  it 'recipe details' do
    expect(page).to have_content('Axel')
    expect(page).to have_content('Total food Items: 0')
    expect(page).to have_content('Total price: 0')
  end

  it 'remove button should be showed' do
    expect(page).to have_selector(:link_or_button, 'Show this recipe')
  end
end
