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
    # byebug
    @recipe_step = RecipeStep.create(recipe_step_params)
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
        { errors: @recipe_step.errors_full_messages }, 
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
        { errors: @recipe_step.errors_full_messages },
        status: :unprocessible_entity
    end
  end

  private

    def recipe_step_params
      params.require(:recipe_step).permit(
        :recipe_id, :id, :name, :yield_in_grams, 
        :yield, :yield_unit_id, :color, :sequence_order)
    end

    def find_recipe_step
      @recipe_step = RecipeStep.find(params[:id])
    end
end
