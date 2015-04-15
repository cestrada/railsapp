#encoding: utf-8
class UserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to boxes_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user.is_logged = 0 unless current_user.nil?
    current_user_session.destroy unless current_user_session.nil?
    flash[:notice] = "¡Ha finalizado la sesión!"
    redirect_back_or_default login_url
  end

end