Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'recipes#public_recipes'

  resources :users do
    resources :recipe_foods, only: [:index, :new, :create, :destroy]
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes
  end

  get 'public_recipes' => 'recipes#public_recipes'
end
