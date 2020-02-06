class UsersController < ApplicationController
    #to stop redundancy, this method will initialize user only before these methods
    before_action :set_user , only: [:edit , :update , :show ]
    def new
        @user = User.new
    end


    def index
        @users = User.paginate(page: params[:page] , per_page: 2)
    end
    def create
        #debugger
        @user = User.new(user_params) #cant do it directly
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to the alpha blog #{@user.username} with email #{@user.email}"
            redirect_to user_path(@user)
        else
            flash[:danger] = "Some error has occured #{@user.username}"
            render 'new'
        end
    end


    def edit
        #@user = User.find(params[:id])        #now @user object have the data of the given user id 
    end

    def update                                      
        #why not used user params
        #@user = User.find(params[:id])        #now @user object have the data of the given user id
        if @user.update(user_params)
            flash[:success] = "Your editing has been done #{@user.username} with email #{@user.email}"
            redirect_to articles_path
        else
            flash[:success] = "Some error has occured while editing this #{@user.username}"
            render 'edit'                     #check for this one too, why we have used just edit 
        end

    end

    def show
        #@user = User.find(params[:id])        #now @user object have the data of the given user id
        @user_articles = @user.articles.paginate(page: params[:page] , per_page: 1)
    end

    private
    def user_params
        params.require(:user).permit(:username, :email , :password)
    end
    def set_user
        @user = User.find(params[:id])
    end
end