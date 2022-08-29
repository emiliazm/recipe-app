Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users do
    resources :recipe_foods
    resources :foods
    resources :recipes
  end
  
  # root "recipes#index"
end
