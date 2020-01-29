class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        #render plain: params[:article].inspect
        @article = Article.new(article_params)
        # @article.save
        # redirect_to article_path(@article)
        if @article.save    #if it is going to be saved in the database
            #do something
            flash[:notice] = "Article was successfully created" #where we are going to display it
            redirect_to article_path(@article)
        else                #if it isnt goign to be saved in the database + everything else
            render :new
        end
    end

    def show
        @article = Article.find(params[:id]) # cant do it directly
    end

    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
end