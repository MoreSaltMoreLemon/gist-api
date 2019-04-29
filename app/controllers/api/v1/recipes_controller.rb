class Api::V1::RecipesController < ApplicationController
  # skip_before_action :authorized, only: [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show
    # byebug
    render json: @recipe, include: ['recipe_ingredients.*', 'recipe_sub_recipes.*']
  end

  def create
    byebug
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      render json: { recipe: RecipeSerializer.new(@recipe) }, status: :created
    else
      render json: 
        { error: 'failed to create recipe' }, 
        status: :not_acceptable
    end
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      render json: @recipe, status: :accepted
    else
      render json: 
        { errors: @recipe.errors_full_messages }, 
        status: :unprocessible_entity
    end
  end

  def destroy
    if @recipe.destroy
      render json:
        { player_destroyed: true },
        status: :accepted
    else 
      render json:
        { errors: @recipe.errors_full_messages },
        status: :unprocessible_entity
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :id, :name, :user_id, 
        :scale_factor, :yield_in_grams, 
        :yield, :yield_unit_id, :public, 
        :recipe_ingredients, :ingredients,
        :recipe_sub_recipes)
    end

    def find_recipe
      # byebug
      @recipe = Recipe.find(params[:id])
    end
end

