require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Users index page', type: :request do
  before(:example) do
    @user = User.create(name: 'Tom', email: 'tom@mail.com')
    sign_in(@user)
    @user.confirm
    @recipe = Recipe.create(user_id: @user.id, name: 'Recipe 1', preparion_time: 120, cooking_time: 120,
                            description: 'First recipe', public: false)
  end

  after(:example) do
    @recipe.destroy
    @user.destroy
  end

  context 'When testing GET #index' do
    before(:example) { get user_recipes_path(user_id: @user.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('New recipe')
    end
  end

  context 'When testing GET #show' do
    before(:example) { get user_recipe_path(@user.id, @recipe.id) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('show')
    end

    it 'should display correct placeholder' do
      expect(response.body).to include('Name')
    end
  end
end
# rubocop:enable Metrics/BlockLength
