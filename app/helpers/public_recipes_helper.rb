module PublicRecipesHelper
  def recipe_price(recipe)
    total = 0
    count = 0
    recipe.recipe_foods.includes([:food]).each do |ingredient|
      food = ingredient.food
      total += ingredient.quantity * food.price
      count += 1
    end
    [count, total]
  end
end
