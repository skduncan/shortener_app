require 'test_helper'

class ShortlinksEditTest < ActionDispatch::IntegrationTest
  def setup
    @shortlink = Shortlink.new(shorturl: "example", longurl: "www.google.com")
  end
  
  test "unsuccessful edit" do
    get edit_shortlink_path(@shortlink)
    assert_template 'shortlinks/edit'
    patch shortlink_path(@shortlink), params: { shortlink: { shorturl:  "",
                                              longurl: "g@@gle>com" }}

    assert_template 'shortlinks/edit'    
    assert_select 'div.alert.alert-danger', text: "The form contains 1 error."
  end
  
  test "successful edit with friendly forwarding" do
    get edit_shortlink_path(@shortlink)
    assert_redirected_to edit_shortlink_url(@shortlink)
    shorturl_new  = "Example2"
    longurl_new = "foobar.com"
    patch shortlink_path(@shortlink), params: { shortlink: { shorturl:  shorturl_new,
                                              longurl: longurl_new} }
    assert_not flash.empty?
    assert_redirected_to @shortlink
    @shortlink.reload
    assert_equal shorturl,  @shortlink.shorturl
    assert_equal longurl, @shortlink.longurl
    assert_redirected_to root_path
  end
  
end