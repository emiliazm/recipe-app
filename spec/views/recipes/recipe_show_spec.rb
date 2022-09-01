require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Users index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Tom', email: 'tom@mail.com')
    sign_in(@user)
    @user.confirm
    @recipe = Recipe.create(user_id: @user.id, name: 'Recipe 1', preparion_time: 120, cooking_time: 120,
                            description: 'First recipe', public: false)
    visit user_recipe_path(@user.id, @recipe.id)
  end

  context 'When on recipe show page' do
    it 'All recipes names should be showed' do
      expect(page).to have_content('Recipe 1')
    end

    it 'recipe preparation time should be showed.' do
      expect(page).to have_content('Preparion time:')
    end

    it 'recipe cooking time should be showed.' do
      expect(page).to have_content('Cooking time:')
    end

    it 'recipe user time should be showed.' do
      expect(page).to have_content('User:')
    end

    it 'recipe public option should be false.' do
      expect(page).to have_content('false')
    end

    it 'recipe description should be showed.' do
      expect(page).to have_content('First recipe')
    end

    it 'back to recipes button should be showed' do
      expect(page).to have_content('Back to recipes')
    end

    it 'When I click on "Back to recipes", it should redirects me to that recipe index page.' do
      click_on 'Back to recipes'
      expect(page).to have_current_path user_recipes_path(@user.id)
    end

    it 'When I click on "Add ingredient", it should redirects me to that new recipe_food page.' do
      click_on 'Add ingredient'
      expect(page).to have_current_path new_user_recipe_recipe_food_path(@user.id, @recipe.id)
    end
  end
end
# rubocop:enable Metrics/BlockLength
