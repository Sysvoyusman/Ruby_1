class UsersController < ApplicationController
    def new
        @user = User.new
    end


    def index
            @users = User.all
    end
    def create
        #debugger
        @user = User.new(user_params) #cant do it directly
        if @user.save
            flash[:success] = "Welcome to the alpha blog #{@user.username} with email #{@user.email}"
            redirect_to articles_path
        else
            flash[:danger] = "Some error has occured #{@user.username}"
            render 'new'
        end
    end


    def edit
        @user = User.find(params[:id])        #now @user object have the data of the given user id 
    end

    def update                                      
        #why not used user params
        @user = User.find(params[:id])        #now @user object have the data of the given user id
        if @user.update(user_params)
            flash[:success] = "Your editing has been done #{@user.username} with email #{@user.email}"
            redirect_to articles_path
        else
            flash[:success] = "Some error has occured while editing this #{@user.username}"
            render 'edit'                     #check for this one too, why we have used just edit 
        end

    end

    def show
        @user = User.find(params[:id])        #now @user object have the data of the given user id
    end

    private
    def user_params
        params.require(:user).permit(:username, :email , :password)
    end
end