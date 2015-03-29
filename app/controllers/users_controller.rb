class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    @users = User.all
    respond_to do |format|
      format.html {}
      format.json { render json: @users, status: :created }
    end
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
end
