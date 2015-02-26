class ProfileController < ApplicationController
  before_action :authenticate_user!
  respond_to :json, :html

  def index
    @user = current_user
    respond_with @user
  end

  def edit
  end
end
