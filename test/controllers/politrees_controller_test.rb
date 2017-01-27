require 'test_helper'

class PolitreesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get politrees_index_url
    assert_response :success
  end

end
