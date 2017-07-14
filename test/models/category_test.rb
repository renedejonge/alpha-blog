#steeds require 'test_helper'
#test_helper.rb staat in de directory test
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # setup is run before the tests
  def setup
    #initialise in-memory Category object
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "category should be present" do
    @category.name = "    "
    assert_not @category.valid?
  end

  test "name should be unique" do
    #first save the in-memory Category object with attribute name equal to "sports" to the table
    @category.save
    #then try to initiate another Category object with the same value for the attribute name
    @category2 = Category.new(name: "sports")
    #our validation should not allow this
    assert_not @category2.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

end