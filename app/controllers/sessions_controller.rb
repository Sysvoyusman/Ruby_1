class SessionsController < ApplicationController

    def new 

    end
    #action method for login
    def create
        #debugger
        user = User.find_by(email: params[:session][:email].downcase)
        #first check if this is valid
        if user && user.authenticate(params[:session][:password])
            #to create session variables and then to set it with current user id
            session[:user_id] = user.id
            flash[:success] = "You have been successfully logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "There was something wrong with your login information"
            render 'new'
        end
    end
    #action method for logout
    def destroy
        session[:user_id] = nil
        flash[:success] = "You have been loged out"
        redirect_to root_path
    end


end