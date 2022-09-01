require 'rails_helper'

RSpec.describe 'Users index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom', email: 'tom@mail.com')
    sign_in(@user)
    @user.confirm
    @recipe = Recipe.create(user_id: @user.id, name: 'Recipe 1', preparion_time: 120, cooking_time: 120,
                            description: 'First recipe', public: false)
    visit user_recipes_path(@user.id)
  end

  context 'When on recipe index page' do
    it 'All recipes names should be showed' do
      expect(page).to have_content('Recipe 1')
    end

    it 'recipe description should be showed.' do
      expect(page).to have_content('First recipe')
    end

    it 'remove button should be showed' do
      expect(page).to have_content('REMOVE')
    end

    it 'When I click on "Show this recipe", it should redirects me to that rercipe show page.' do
      click_on 'Show this recipe'
      expect(page).to have_current_path user_recipe_path(@user.id, @recipe.id)
    end
  end
end
