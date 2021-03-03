require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup                           #this fn runs before other fn every time
        @category = Category.new(name: "Sports") 
    end

    test "category should be valid" do
         # This test checks wether the table is created for the modeel and wethere its accessible
        assert @category.valid?
    end

    #the below testing enviorments checks for the model validation

    test "name should be present" do 
        @category.name= " "
        assert_not @category.valid?

    end

    test "name should be unique" do 
        @category.save
        @category2 = Category.new(name: "Sports") 
        assert_not @category2.valid?

    end

    test "name should not be too long" do

        @category.name = "a" * 26
        assert_not @category.valid?


    end

    test "name should not be too short" do
        @category.name = "a" * 2
        assert_not @category.valid?

    end

end
