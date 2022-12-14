Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'confirmations'
  }
  
  root 'public_recipes#index'
  
  resources :users do
    resources :recipes do
      resources :recipe_foods
    end
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :public_recipes, only: [:index]
    resources :shopping_lists, only: [:index]
  end
end
