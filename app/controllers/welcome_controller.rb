class WelcomeController < ApplicationController
  respond_to :json, :html
  def index
  	if current_user.present?
      profile_path
  	end
  end

  def a 
  end

  def csrf
    response.headers['X-CSRF-TOKEN'] = form_authenticity_token
    send_data "OK", :disposition => 'inline', :type => 'text/plain'
  end
end
