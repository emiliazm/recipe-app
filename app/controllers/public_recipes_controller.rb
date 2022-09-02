class PublicRecipesController < ApplicationController
  include PublicRecipesHelper
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
