Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root 'recipes#public_recipes'
  
  resources :users do
    resources :recipes do
      resources :recipe_foods
    end
    resources :foods, only: [:index, :new, :create, :destroy]
  end

  get 'public_recipes' => 'recipes#public_recipes'
  get 'shopping_list' => 'recipe_foods#shopping_list'
end
