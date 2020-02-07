require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
#we want to test our category model
#first we need a key method called setup, this method will run before everyone of your tests
    def setup
        #lets initiate an instance variable
        #this is going to be created in your test database and garbage will be handeled automatically
        @category = Category.new(name: "sports")
    end

    test "category should be valid" do 
        #whatever you write in this block will be a test 
        #can we initiate new category value ?
        assert @category.valid?     #expecting it to be true
    end

    test "name should be present" do
        @category.name = " "
    assert_not @category.valid? #now expecting it to be false
    end
end 