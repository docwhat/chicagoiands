require 'rendered_model'

class Story < ActiveRecord::Base
  include RenderedModel
  attr_accessible :title, :body, :author

  validates :title, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :body, presence: true, length: { minimum: 10 }

  def to_param
    "#{id}-#{title.downcase.gsub(/[^a-z0-9':-]+/i, '_')}"
  end
end
