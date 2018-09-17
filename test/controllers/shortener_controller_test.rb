require 'test_helper'

class ShortenerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get shortener_home_url
    assert_response :success
  end

end
