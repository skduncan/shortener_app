require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @shortlink = Shortlink.new(shorturl: "/example", longurl: "/exampletwo")
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
end