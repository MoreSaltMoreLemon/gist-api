class Api::V1::StepSubRecipesController < ApplicationController
  # skip_before_action :authorized, only: [:index]
  before_action :find_step_sub_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @step_sub_recipes = StepSubRecipe.all
    render json: @step_sub_recipes
  end

  def show
    byebug
    render json: @step_sub_recipe, include: ['sub_recipe.*'], status: :accepted
  end

  def create
    byebug
    @recipe = Recipe.find_by(name: step_sub_recipe_params[:sub_recipe][:name])
    if @recipe.nil?
      @user = User.find(step_sub_recipe_params[:user_id])
      # byebug
      @recipe = Recipe.create(
        name: step_sub_recipe_params[:sub_recipe][:name], 
        user: @user
      )
      # byebug
    end
    @recipe_step = RecipeStep.find(step_sub_recipe_params[:recipe_step_id])
    if @recipe_step.step_sub_recipes.length == 0
      sequence_order = 0
    else
      sequence_order = @recipe_step.step_sub_recipes.max_by {|ri| ri.sequence_order}.sequence_order
    end
    # monstrosity used to get around Rails odd handling of errors when
    # creating a record. Cannot dirctly use strong params to create as it
    # needs the reference to the ingredient and nested params are garbage.
    @step_sub_recipe = StepSubRecipe.create(
      recipe_step: @recipe_step,
      sub_recipe: @recipe,
      quantity: step_sub_recipe_params[:quantity] || 0,
      unit_id: step_sub_recipe_params[:unit_id] || 1,
      instruction: step_sub_recipe_params[:instruction] || '',
      color: step_sub_recipe_params[:color] || '#a6cee3',
      sequence_order: sequence_order + 1,
      is_sub_recipe: true)
    if @step_sub_recipe.valid?
      render json: @step_sub_recipe, include: ['sub_recipe.*'], status: :created
    else
      render json: 
        { error: 'failed to create step_sub_recipe' }, 
        status: :not_acceptable
    end
  end

  def update
    byebug
    @ingredient = Ingredient.find_or_create_by(name: step_sub_recipe_params[:ingredient][:name])
    # byebug
    # monstrosity used to get around Rails odd handling of errors when
    # creating a record. Cannot dirctly use strong params to create as it
    # needs the reference to the ingredient and nested params are garbage.
    @step_sub_recipe.update(
      recipe_step_id: step_sub_recipe_params[:recipe_step_id],
      quantity: step_sub_recipe_params[:quantity] || 0,
      unit_id: step_sub_recipe_params[:unit_id] || 1,
      instruction: step_sub_recipe_params[:instruction] || '',
      color: step_sub_recipe_params[:color] || '#a6cee3',
      sequence_order: step_sub_recipe_params[:sequence_order] || 0,
      is_sub_recipe: false,
      ingredient: @ingredient)
    # byebug
    if @step_sub_recipe.save
      render json: @step_sub_recipe, include: ['sub_recipe.*'], status: :accepted
    else
      render json: 
        { errors: @step_sub_recipe.errors_full_messages }, 
        status: :unprocessible_entity
    end
  end

  def destroy
    byebug
    if @step_sub_recipe.destroy
      render json:
        { step_sub_recipe_destroyed: true },
        status: :accepted
    else 
      render json:
        { errors: @step_sub_recipe.errors_full_messages },
        status: :unprocessible_entity
    end
  end

  private

    def step_sub_recipe_params
      
      params.require(:step_sub_recipe).permit(:id, :user_id, :recipe_step_id, :sub_recipe_id, :quantity, :unit_id, :instruction, :color, :sequence_order, :is_sub_recipe, sub_recipe: [:id, :name])
    end

    def find_step_sub_recipe
      # byebug
      @step_sub_recipe = StepSubRecipe.find(params[:id])
    end
end
