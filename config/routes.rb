Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "recipes#index"
  
  resources :users do
    resources :recipes do
      resources :recipe_foods
    end
    resources :foods
  end

  # resources :foods
  # resources :recipes do
  #   resources :recipe_foods
  # end
end
