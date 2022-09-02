require 'rails_helper'

RSpec.describe 'Users new page', type: :request do
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

  context 'When testing GET #new' do
    before(:example) { get new_user_recipe_recipe_food_path(@user.id, @recipe.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('new')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('New recipe food')
    end
  end
end
