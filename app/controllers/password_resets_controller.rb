#encoding: utf-8
class PasswordResetsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	 if user
      user.send_password_reset
      redirect_to login_url, notice: "Correo enviado con las instrucciones para restablecer su contraseña."
    else
      redirect_to login_url, flash: { error: "La cuenta de correo ingresada es inválida." }
    end
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
  		redirect_to new_password_reset_path, alert: "La solicitud para restablecer la contraseña ha expirado. Genere una nueva solicitud."
  	elsif @user.update_attributes(params[:user])
  		redirect_to root_url, notice: "Bienvenido al sistema. La contraseña ha sido restablecida."
  	else
  		render :edit
  	end
  end

end
