require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get index_create_url
    assert_response :success
  end

  test "should get destroy" do
    get index_destroy_url
    assert_response :success
  end

  test "should get comment_params" do
    get index_comment_params_url
    assert_response :success
  end

end
