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
    @user_post = UserPost.new
    @user_posts = UserPost.all
    
    if (params[:id])
      @user = User.find(params[:id])
    end
    if @user == current_user
      redirect_to profile_path
    end
  end

  def following
    @following = current_user.followers_by_type("User")
  end

  def followers
    @followers = current_user.followers_by_type("User")
  end
end
