=begin
require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    test "should get categories index" do
        #get categories_path
        get :index
        assert_response :success
    end

    test "should get new category" do
        get :new
        assert_response :success
    end

    test "should get show" do
        get :show
        assert_response :success
    end

end
=end