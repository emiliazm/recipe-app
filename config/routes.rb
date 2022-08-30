Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "users#index"

  resources :users do
    resources :recipe_foods, only: [:index, :new, :create, :destroy]
    resources :foods
    resources :recipes
  end
end
