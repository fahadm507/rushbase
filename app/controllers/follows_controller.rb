class FollowsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @user = User.find(params[:id])
    respond_to do |format|
      if current_user.follow(@user)
        format.js {} 
      else
        format.js {}
      end
    end
  end

  def destroy
    binding.pry
    @unfollow = Follow.find_by(followable_id: params[:id])
    respond_to do |format|
      if current_user.stop_following(@ufollow)
        format.js {}
      else
        format.js {}
      end
    end
  end
end
