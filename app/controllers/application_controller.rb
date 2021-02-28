class ApplicationController < ActionController::Base

    helper_method :current_user , :logged_in?#This make the defined method as an helper method and make it available in views

    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert]= "You must be loggin to perform the action"
            redirect_to login_path
        end
    end

end
