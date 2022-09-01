class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user_id: current_user.id)
    @recipe = Recipe.find_by(id: params[:recipe_id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to user_recipe_path(current_user.id, @recipe.id), notice: 'Recipe food was successfully created.'
        end
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
