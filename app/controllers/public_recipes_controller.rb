class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
    # @foods = Food.where(id: @recipe_foods)
    @foods = current_user.foods.where(id: @recipe_foods).order(:id)
  end
end
