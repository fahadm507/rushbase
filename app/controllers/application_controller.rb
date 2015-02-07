class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    profile_index_path
  end

  def after_sign_out_path_for(resource)
  	root_path
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
