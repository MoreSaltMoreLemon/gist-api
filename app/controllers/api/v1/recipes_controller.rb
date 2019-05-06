class Api::V1::RecipesController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    # byebug
    render json: @recipes, each_serializer: RecipeShortSerializer, status: :accepted
    #ActiveModel::SerializableResource.new(@recipes, adapter: :json_api).to_json #
    
  end

  def show
    render json: @recipe, include: [
      'recipe_steps.*', 
      'recipe_steps.step_ingredients.*', 
      'recipe_steps.step_sub_recipes.*'
      ], status: :accepted
  end

  def create
    # byebug
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      render json: @recipe, include: [
        'recipe_steps.*', 
        'recipe_steps.step_ingredients.*', 
        'recipe_steps.step_sub_recipes.*'
        ], status: :created
    else
      render json: { error: 'failed to create recipe' }, status: :not_acceptable
    end
  end

  def update
    # byebug
    @recipe.update(recipe_params)
    if @recipe.save
      render json: @recipe, include: [
        'recipe_steps.*', 
        'recipe_steps.step_ingredients.*', 
        'recipe_steps.step_sub_recipes.*'
        ], status: :accepted
    else
      render json: 
        { error: 'failed to update recipe', errors: @recipe.errors_full_messages }, 
        status: :unprocessible_entity
    end
  end

  def destroy
    # byebug
    # @recipe.step_sub_recipes
    if @recipe.destroy
      render json:
        { recipe_destroyed: true },
        status: :accepted
    else 
      render json:
        { error: 'failed to delete recipe', errors: @recipe.errors_full_messages },
        status: :unprocessible_entity
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :id, :uuid, :name, :description, :user_id, 
        :scale_factor, :yield_in_grams, 
        :yield, :yield_unit_id, :public,
        :image_url, recipe_steps: [])
    end

    def find_recipe
      # byebug
      @recipe = Recipe.find(params[:id])
    end
end

