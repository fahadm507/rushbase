class WelcomeController < ApplicationController
  respond_to :json, :html
  def index
  	if current_user.present?
  	  redirect_to profile_index_path
  	end
  end
end
