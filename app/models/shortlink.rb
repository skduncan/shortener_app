class Shortlink < ApplicationRecord
  
  before_save :format_url

  validates :shorturl, presence: true
  validates_format_of :shorturl, :with => /\A[a-zA-Z0-9_-]{2,30}\Z/
  validates :longurl, presence: true
  validates_format_of :longurl, :with => /\A[a-zA-Z0-9._-]{2,30}\Z/
 # validates_format_of :longurl, :with => URI::regexp(%w(http https)) # add checks for .com, .net, etc., filter out symbols (@, &, etc.)
  
  def format_url
    if self.longurl.include?("https://") || self.longurl.include?("http://")
      self.longurl
    else 
      self.longurl = "http://#{self.longurl}"
    end
  end

end
