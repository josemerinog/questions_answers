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
  		flash.now[:error] = 'Combinación usuario/password incorrecta.'
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: 'Sesión Cerrada correctamente'
  end


end
