class ArticlesController < ApplicationController
    #to stop redundancy, this method will initialize user only before these methods it should be before these methods
    before_action :set_article, only: [:edit , :update , :show , :destroy]
    #other than these two you require logged in user for all of the actions
    before_action :require_user, except: [:index, :show]    #used from applicaiton controller
    before_action :require_same_user, only: [:edit, :update , :destroy]  
    
    def index
        @articles = Article.paginate(page: params[:page] , per_page: 2)     #@articles is an instance variable
    end

    def new
        @article = Article.new
    end

    def edit
        #@article = Article.find(params[:id]) # cant do it directly/ in order to find the article
    end


    def create      #new form submittion is handeled by the create action by default
                    #render plain: params[:article].inspect
        @article = Article.new(article_params)
        @article.user = current_user
                    # @article.save
                    # redirect_to article_path(@article)
        if @article.save       #if it is going to be saved in the database
                    #do something
            flash[:success] = "Article was successfully created" #where we are going to display it
            redirect_to article_path(@article)
        else                   #if it isnt goign to be saved in the database + everything else
            render :new        #show the new view
        end
    end
#for edit
    def update      #update form submittion is handeled bt the update action by default
        #@article = Article.find(params[:id])
        if @article.update(article_params)   #if it is going to be saved in the database
                    #do something
            flash[:success] = "Article was successfully updated" #where we are going to display it
                    #if you put edit_article_path if will remain on the same page
            redirect_to article_path(@article)
        else                   #if it isnt goign to be saved in the database + everything else
            render :edit       #show the edit view
        end
    end


    def show
        #@article = Article.find(params[:id]) # cant do it directly/ in order to find the article 
    end

   
    def destroy
        #@article = Article.find(params[:id]) # cant do it directly/ in order to find the article
        @article.destroy
        flash[:danger] = "Article was successfully deleted"
        #redirect_to article_path(@article)
        #redirect_to :back #only works before rail 5        
        redirect_back(fallback_location: root_path)
    end

    private


    def article_params
        params.require(:article).permit(:title, :description)
    end
    def set_article
        @article = Article.find(params[:id])
    end
    def require_same_user
        #@article has already been created in before action
        if current_user != @article.user 
            flash[:danger] = "You can only edit or delete your own articles"
            redirect_to root_path
        end
    end
end