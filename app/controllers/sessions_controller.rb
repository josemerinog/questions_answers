class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:session][:username])
  	if user && user.authenticate(params[:session][:password])
  		login user
  		flash[:success] = 'Sesión Iniciada correctamente!'
  		redirect_to root_url
  	else
  		flash.now[:error] = 'La combinación usuario/password fue incorrecta.'
  		render 'new'
  	end
  end
end
