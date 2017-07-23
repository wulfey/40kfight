class ApplicationController < ActionController::Base

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception, prepend: true




    include SessionsHelper

    # applicationcontrollker helper functions are not available to views by default
    # but they are available to all the controllers
    helper_method :current_user, :logged_in?

    # before_filter :require_login

    before_action :configure_permitted_parameters, if: :devise_controller?



    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # def current_user
    #   # return this user if session:user_id exists in the session hash based on said user_id
    #   # gives the whole user object from the session hash
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #   #don't go to DB is you already have @current_user, otherwise find it
    # end

    def logged_in?
      # !! converts whatever after it into a boolean
      !!current_user
    end

    def require_user
      if !logged_in?
        flash[:danger] = "You must be logged in."
        redirect_to root_path
      end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    private

      def require_login
        unless current_user
          redirect_to new_user_session_path
        end
      end


end
