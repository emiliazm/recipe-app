class ShoppingListsController < ApplicationController
  def index
    # @recipe_foods = RecipeFood.all
    # @all_foods = current_user.foods.where(id: @recipe_foods).order(:id)
    # @food_number = @all_foods.length
    @foods = current_user.foods
  end
end
