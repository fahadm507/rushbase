class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  def index
    @users = User.paginate(page: params[:page], per_page: 60)
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

  def finish
  end

  def update
    saved = current_user.update(user_params)
    if saved
      redirect_to user_path(current_user)
    end
  end

  def following
    @user = User.find(params[:id])
    following_users = @user.following_by_type("User")
    @following = User.reject_user(following_users, current_user) || following_users
  end

  def followers
    @user = User.find(params[:id])
    followers = @user.followers_by_type("User")
    @followers = User.reject_user(followers, current_user) || followers
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :industry_id, :email)
  end
end
