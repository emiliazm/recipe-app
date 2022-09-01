require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Users index page', type: :request do
  before(:example) do
    @user = User.create(name: 'Tom', email: 'tom@mail.com')
    sign_in(@user)
    @user.confirm
    @recipe = Recipe.create(user_id: @user.id, name: 'Recipe 1', preparion_time: 120, cooking_time: '1',
                            description: 'First recipe', public: false)
  end

  after(:example) do
    @recipe.destroy
    @user.destroy
  end

  context 'When name must not be blank' do
    it 'title should be present.' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'title should be valid.' do
      expect(@recipe).to be_valid
    end
  end

  context 'When name must not exceed 25 characters ' do
    it 'name should not exceed 25 characters.' do
      @recipe.name = 'a' * 30
      expect(@recipe).to_not be_valid
    end

    it 'name should not exceed 25 characters and should be valid' do
      expect(@recipe).to be_valid
    end
  end

  context 'When preparation_time must be an integer greater than or equal to zero.' do
    it 'preparation_time should not be valid when negative numbers.' do
      @recipe.preparion_time = -1
      expect(@recipe).to_not be_valid
    end

    it 'preparation_time should not be valid when null' do
      @recipe.preparion_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'preparation_time should be valid with numbers greater that or equal to zero' do
      expect(@recipe).to be_valid
    end
  end

  context 'When cooking_time must be an integer greater than or equal to zero.' do
    it 'cooking_time should not be valid when negative numbers.' do
      @recipe.cooking_time = -1
      expect(@recipe).to_not be_valid
    end

    it 'cooking_time should not be valid when null' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'cooking_time should be valid with numbers greater that or equal to zero' do
      expect(@recipe).to be_valid
    end
  end

  context 'When description must not exceed 250 characters ' do
    it 'description should not exceed 250 characters.' do
      @recipe.description = 'a' * 300
      expect(@recipe).to_not be_valid
    end

    it 'description should not exceed 250 characters and should be valid' do
      expect(@recipe).to be_valid
    end
  end
end
# rubocop:enable Metrics/BlockLength
