class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update]
  before_action :authenticate_user!, only: :update

  def show
    render json: @user.to_json(:include => :posts)
  end

  def update
    if @user.update(user_params)
      render json: @user.to_json(:include => :posts)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.permit(:username, :avatar)
  end     

end