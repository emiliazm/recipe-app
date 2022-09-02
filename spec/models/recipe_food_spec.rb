require 'rails_helper'

RSpec.describe 'Users index page', type: :request do
  before(:example) do
    @user = User.create(name: 'Tom', email: 'tom@mail.com')
    sign_in(@user)
    @user.confirm
    @food = Food.create(name: 'Food1', measurement_unit: 'kg', price: '20', quantity: '1', user_id: @user.id)
    @recipe = Recipe.create(user_id: @user.id, name: 'Recipe 1', preparion_time: 120, cooking_time: 120,
                            description: 'First recipe', public: false)
    @recipe_food = RecipeFood.create(quantity: '1', recipe_id: @recipe.id, food_id: @food.id)
  end

  after(:example) do
    @recipe_food.destroy
    @food.destroy
    @recipe.destroy
    @user.destroy
  end

  context 'When adding a recipe food' do
    it 'recipe_foods shold be equal to 1' do
      expect(@recipe.recipe_foods.length).to eq(1)
    end

    it 'quantity shold be equal to 1' do
      expect(@recipe_food.quantity).to eq(1)
    end
  end
end
