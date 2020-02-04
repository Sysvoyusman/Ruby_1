class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #debugger
        @user = User.new(user_params) #cant do it directly
        if @user.save
            flash[:success] = "Welcome to the alpha blog #{@user.username} with email #{@user.email}"

            redirect_to articles_path
        else
            flash[:success] = "Some error has occured #{@user.username}"
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email , :password)
    end
end