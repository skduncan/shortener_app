require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @shortlink = Shortlink.new(shorturl: "example", longurl: "www.google.com")
  end

  test "should be valid" do
    assert @shortlink.valid?
  end
  
  test "shorturl should be present" do
    @shortlink.shorturl = "     "
    assert_not @shortlink.valid?
  end
  
  test "longurl should be present" do
    @shortlink.longurl = "     "
    assert_not @shortlink.valid?
  end
  
  test "longurl validation should accept valid entry" do
    valid_longurls = %w[google.com www.google.com http://google.com
                          https://google.com https://www.youtube.com]
    valid_longurls.each do |valid_longurl|
      @shortlink.longurl = valid_longurl
      assert @shortlink.valid?, "#{valid_longurl.inspect} should be valid"
    end 
  end
  
  test "longurl validation should reject invalid entry" do
    invalid_longurls = %w[google-^com www.google,com http$@):/google,com
                          123./google_>com https+--www.youtube.com]
    invalid_longurls.each do |invalid_longurl|
      @shortlink.longurl = invalid_longurl
      assert_not @shortlink.valid?, "#{invalid_longurl.inspect} should be invalid"
    end 
  end
end