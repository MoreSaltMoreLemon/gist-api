class Api::V1::StepIngredientsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :find_step_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @step_ingredients = StepIngredient.all
    render json: @step_ingredients
  end

  def show
    # byebug
    render json: @step_ingredient, include: ['ingredient.*'], status: :accepted
  end

  def create
    # byebug
    
    @ingredient = Ingredient.find_by(name: step_ingredient_params[:ingredient][:name])
    if @ingredient.nil?
      if step_ingredient_params[:ingredient][:uuid].nil?
        uuid = UUID.new.generate
      else
        uuid = step_ingredient_params[:ingredient][:uuid]
      end

      @ingredient = Ingredient.create(
        uuid: uuid, 
        name: step_ingredient_params[:ingredient][:name], 
      )
    end

    @recipe_step = RecipeStep.find(step_ingredient_params[:recipe_step_id])
    # byebug
    # monstrosity used to get around Rails odd handling of errors when
    # creating a record. Cannot dirctly use strong params to create as it
    # needs the reference to the ingredient and nested params are garbage.
    @step_ingredient = StepIngredient.create(
      uuid: step_ingredient_params[:uuid],
      recipe_step_id: step_ingredient_params[:recipe_step_id],
      quantity: step_ingredient_params[:quantity] || 0,
      unit_id: step_ingredient_params[:unit_id] || 1,
      instruction: step_ingredient_params[:instruction] || '',
      color: step_ingredient_params[:color] || '#a6cee3',
      sequence_order: @recipe_step.next_sequence_order,
      is_sub_recipe: false,
      ingredient: @ingredient)
    if @step_ingredient.valid?
      render json: @step_ingredient, include: ['ingredient.*'], status: :created
    else
      byebug
      render json: 
        { error: 'failed to create step_ingredient' }, 
        status: :not_acceptable
    end
  end

  def update
    # byebug
    @ingredient = Ingredient.find_or_create_by(name: step_ingredient_params[:ingredient][:name])
    # byebug
    # monstrosity used to get around Rails odd handling of errors when
    # creating a record. Cannot dirctly use strong params to create as it
    # needs the reference to the ingredient and nested params are garbage.
    @step_ingredient.update(
      uuid: step_ingredient_params[:uuid],
      recipe_step_id: step_ingredient_params[:recipe_step_id],
      quantity: step_ingredient_params[:quantity] || 0,
      unit_id: step_ingredient_params[:unit_id] || 1,
      instruction: step_ingredient_params[:instruction] || '',
      color: step_ingredient_params[:color] || '#a6cee3',
      sequence_order: step_ingredient_params[:sequence_order] || 0,
      is_sub_recipe: false,
      ingredient: @ingredient)
    # byebug
    if @step_ingredient.save
      render json: @step_ingredient, include: ['ingredient.*'], status: :accepted
    else
      render json: 
        { error: 'failed to update step_ingredient', errors: @step_ingredient.errors_full_messages }, 
        status: :unprocessible_entity
    end
  end

  def destroy
    # byebug
    if @step_ingredient.destroy
      render json:
        { step_ingredient_destroyed: true },
        status: :accepted
    else 
      render json:
        { error: 'failed to delete step_ingredient', errors: @step_ingredient.errors_full_messages },
        status: :unprocessible_entity
    end
  end

  private

    def step_ingredient_params
      
      params.require(:step_ingredient).permit(:id, :uuid, :recipe_step_id, :ingredient_id, :quantity, :unit_id, :instruction, :color, :sequence_order, :is_sub_recipe, ingredient: [:id, :name])
    end

    def find_step_ingredient
      # byebug
      @step_ingredient = StepIngredient.find(params[:id])
    end
end
