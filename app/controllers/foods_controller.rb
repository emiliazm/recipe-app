class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods.order(:id)
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(user: current_user, name: food_params[:name], measurement_unit: food_params[:measurement_unit],
                     price: food_params[:price], quantity: food_params[:quantity])

    respond_to do |format|
      if @food.save
        format.html { redirect_to user_foods_path, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to user_foods_path, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
