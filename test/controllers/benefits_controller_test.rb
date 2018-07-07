require 'test_helper'

class BenefitsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get benefits_edit_url
    assert_response :success
  end

  test "should get index" do
    get benefits_index_url
    assert_response :success
  end

  test "should get new" do
    get benefits_new_url
    assert_response :success
  end

  test "should get show" do
    get benefits_show_url
    assert_response :success
  end

end
