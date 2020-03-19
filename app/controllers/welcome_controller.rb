class WelcomeController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  def home
    @minimum_password_length = User.password_length.min
    render :layout => false
  end

  def privacy
  end

  private 

  def resource_name 
    :user
  end

  def resource
    @resource ||=User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
 
  def resource_class
    User
  end
end