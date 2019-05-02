class Api::V1::RecipeStepsController < ApplicationController
  # skip_before_action :authorized, only: [:index]
  before_action :find_recipe_step, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_steps = RecipeStep.all
    render json: @recipe_steps
  end

  def show
    render json: @recipe_step, include: ['step_ingredients.*', 'step_sub_recipes.*'], status: :accepted
  end

  def create
    @recipe = Recipe.find(recipe_step_params[:recipe_id])
    
    if recipe_step_params[:uuid].nil?
      uuid = UUID.new.generate
    else
      uuid = recipe_step_params[:uuid]
    end
    
    # byebug
    @recipe_step = RecipeStep.create(
      recipe: @recipe,
      uuid: uuid,
      name: recipe_step_params[:name] || '',
      yield_in_grams: recipe_step_params[:yield_in_grams] || 0,
      yield: recipe_step_params[:yield] || 0,
      yield_unit_id: recipe_step_params[:yield_unit_id] || 1,
      color: recipe_step_params[:color] || '#a6cee3',
      sequence_order: @recipe.next_sequence_order
    )

    if @recipe_step.valid?
      render json: @recipe_step, include: ['step_ingredients.*', 'step_sub_recipes.*'], status: :created
    else
      byebug
      render json: 
        { error: 'failed to create recipe_step' }, 
        status: :not_acceptable
    end
  end

  def update
    # byebug
    @recipe_step.update(recipe_step_params)
    if @recipe_step.save
      render json: @recipe_step, include: ['step_ingredients.*', 'step_sub_recipes.*'], status: :accepted
    else
      render json: 
        { error: 'failed to update recipe_step', errors: @recipe_step.errors_full_messages }, 
        status: :unprocessible_entity
    end
  end

  def destroy
    # byebug
    if @recipe_step.destroy
      render json:
        { player_destroyed: true },
        status: :accepted
    else 
      render json:
        { error: 'failed to update recipe_step', errors: @recipe_step.errors_full_messages },
        status: :unprocessible_entity
    end
  end

  private

    def recipe_step_params
      params.require(:recipe_step).permit(
        :recipe_id, :id, :uuid, :name, :yield_in_grams, 
        :yield, :yield_unit_id, :color, :sequence_order)
    end

    def find_recipe_step
      @recipe_step = RecipeStep.find(params[:id])
    end
end
