class WelcomeController < ApplicationController
  respond_to :json, :html
  def index
  	if current_user.present?
      profile_path
  	end
  end
end
