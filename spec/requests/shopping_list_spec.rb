require 'rails_helper'

RSpec.describe 'Shopping List ', type: :request do
  before do
    @user = User.create(name: 'Axel', email: 'axel@gmail2.com')
    sign_in(@user)
    @user.confirm
  end

  context 'GET Public Recipes page #index' do
    before do
      get user_shopping_lists_path(@user.id)
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'body includes correct placeholder text' do
      assert_select 'h1', 'Shopping List'
    end
  end
end
