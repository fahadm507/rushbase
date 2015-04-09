class FollowController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = User.find(params[:id])
    respond_to do |format|
      if current_user.follow(@user)
        format.html { render 'users/following'}
        format.js {}
        format.json { render json: @user }
      end
    end
  end

  def destroy
    @unfollow = Follow.find(params[:id])
    if current_user.stop_following(@ufollow)
      render "user/following"
    end
  end
end
