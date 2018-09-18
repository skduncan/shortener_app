class Shortlink < ApplicationRecord
  
  before_save :format_url

  validates :shorturl, presence: true
  validates :longurl, presence: true
  validates_format_of :longurl, :with => URI::regexp(%w(http https))
  
  def format_url
    self.longurl = “http://#{self.longurl}” unless self.website[/^https?/]
  end

end
