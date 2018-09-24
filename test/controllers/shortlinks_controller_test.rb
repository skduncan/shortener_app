require 'test_helper'

class ShortlinksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @shortlink = Shortlink.new(shorturl: "example", longurl: "www.google.com")
  end
  
  test "should get home" do
    get root_path
    assert_response :success
  end
  
  test "should get new" do
    get newlink_path
    assert_response :success
  end

end
