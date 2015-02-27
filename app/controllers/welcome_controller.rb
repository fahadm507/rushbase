class WelcomeController < ApplicationController
  def index
  	if current_user.present?
  	  redirect_to profile_index_path
  	end
  end
end