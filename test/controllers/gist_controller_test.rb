require "test_helper"

class GistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gist_index_url
    assert_response :success
  end

  test "should get show" do
    get gist_show_url
    assert_response :success
  end
end
