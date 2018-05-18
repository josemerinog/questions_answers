class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method [:current_user, :logged_in?]

  protected

  def login(user)
  	session[:user_id] = user.id
  end

  def current_user
  	current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!current_user.nil?
  end

  def auth
    redirect_to login_url, alert: 'Debes Inciar Sesión para ver esta página!' unless logged_in?
    
  end

end
