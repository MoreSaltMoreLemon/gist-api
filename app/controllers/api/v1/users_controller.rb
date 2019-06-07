class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    render json: current_user, include: ['recipes'], status: :accepted
  end

  def show
    render json: @user, include: ['recipes'], status: :accepted
  end

  def create
    combined_params = {}.merge(user_params)

    if combined_params[:uuid].nil?
      combined_params[:uuid] = UUID.new.generate
    end

    @user = User.create(combined_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
        render json: { 
          user: UserShortSerializer.new(@user), 
          jwt: token 
        }, status: :accepted
    else
      render json: 
        { error: 'failed to create user' }, 
        status: :not_acceptable
    end
  end

  def update
    if @user == current_user
      @user.update(user_params)
      if @user.save
        render json: {user: UserShortSerializer.new(@user) }, status: :accepted
      else
        render json: { 
          error: 'failed to update user', 
          errors: @user.errors_full_messages 
        }, status: :unprocessible_entity
      end
    else 
      render json: { 
        error: 'invalid user', 
        errors: ['cannot modify another user']
      }, status: :unauthorized
    end

  end

  def destroy
    if @user == current_user
      @user.update(user_params)
      if @user.destroy
        render json:
          { user_destroyed: true },
          status: :accepted
      else 
        render json:
          { error: 'failed to delete user', errors: @user.errors_full_messages },
          status: :unprocessible_entity
      end
    else 
      render json: { 
        error: 'invalid user', 
        errors: ['cannot modify another user']
      }, status: :unauthorized
    end
  end

  private

    def user_params
      params.require(:user).permit(:id, :uuid, :username, :email, :password)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
