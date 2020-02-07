class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new 
        #now handle the form submittion to create action
    end

    def create
        #need a form where we can submit something in create action, create in new action
        @category = Category.new(category_params)   #we have to whitelist it first in private method
        if @category.save
            flash[:success] = "Category was created successfully"
            redirect_to categories_path
        else
            render'new'
        end
    end

    def show

    end
    private #All the mothods below it are only accessible to this controller
    def category_params
        params.require(:category).permit(:name) #name of category has been whitelisted
    end
end
