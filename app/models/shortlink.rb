class Shortlink < ApplicationRecord
  validates :shorturl, presence: true
  validates :longurl, presence: true
end
