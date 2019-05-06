class Api::V1::UnitsController < ApplicationController
  # skip_before_action :authorized, only: [:index]
  def index
    @units = Unit.all
    render json: @units, status: :accepted
  end
end
