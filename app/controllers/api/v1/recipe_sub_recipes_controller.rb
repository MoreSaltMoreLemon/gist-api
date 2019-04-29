class Api::V1::RecipeSubRecipesController < ApplicationController
  # skip_before_action :authorized, only: [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    def recipe_sub_recipe_params
      params.require(:recipe_sub_recipe).permit(
        :id, :sequence_order, :sub_recipe)
    end

    def find_recipe
      # byebug
      @recipe_sub_recipe = RecipeSubRecipe.find(params[:id])
    end
end

