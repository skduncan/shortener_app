require 'test_helper'

class ShortlinksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shortlinks_new_url
    assert_response :success
  end

end
