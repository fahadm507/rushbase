class WelcomeController < ApplicationController
  respond_to :json, :html
  def index
  	if current_user.present?
  	end
  end
end
