class FollowsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    user_id = params[:user_id].first.first.to_i
    @user = User.find(user_id)
    respond_to do |format|
      if current_user.follow(@user)
        format.js {}
      else
        format.js {}
      end
    end
  end

  def destroy
    @followed = Follow.find(params[:id])
    @user = @followed.followable
    respond_to do |format|
      if current_user.stop_following(@user)
        format.js {}
      else
        format.js {}
      end
    end
  end
end
