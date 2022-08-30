Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "users#index"

  resources :users do
    resources :recipe_foods, only: [:index, :new, :create, :destroy]
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes
  end
end
