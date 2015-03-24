class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
