class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    #these two are going to be availaible to our views
    helper_method :current_user, :logged_in?
    def current_user
        #this @ is called memoization , if already checked return else check the database
        #user_id was created in session controller
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        #return true if you have a current user else return false
        !!current_user

    end

    def require_user
        #to check of there is a logged in user or not  
        if !logged_in?
            flash[:danger] = "you must be logged in to perform that action"
            redirect_to root_path
        end
    end

end


