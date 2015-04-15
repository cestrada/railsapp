#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  #filter_parameter_logging :password, :password_confirmation # there are underscores
  helper :all
  helper_method :current_user_session, :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "No tienes permiso para ejecutar esta acción."
      if current_user.role_id == 1
        redirect_to '/boxes', only_path: true
      elsif current_user.role_id == 2
        redirect_back_or_default(root_url)
      end
  end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "Necesitas iniciar sesión para acceder al sistema."
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        # flash[:notice] = "Necesitas iniciar sesion para acceder a esta pagina."
        # redirect_to home_index_path
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default = root_path, *options)
      tag_options = {}
      options.first.each { |k,v| tag_options[k] = v } unless options.empty?
      redirect_to (request.referer.present? ? :back : default), tag_options
    end

end