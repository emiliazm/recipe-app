require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  before do
    @user = User.create(name: 'Axel', email: 'axel@gmail2.com')
    sign_in(@user)
    @user.confirm
    @food = Food.create(name: 'food1', measurement_unit: 'kg', price: '1', quantity: '5', user_id: @user.id)
  end

  context 'GET users page #index' do
    before do
      get user_foods_path(@user.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h1', 'Foods'
    end
  end
end
