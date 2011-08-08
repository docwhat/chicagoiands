require 'kramdown'

class Story < ActiveRecord::Base
  before_save :update_rendered

  validates :title, :presence => true, :length => {:minimum => 2}, :uniqueness => true
  validates :body, :presence => true, :length => {:minimum => 10}

  def update_rendered
    self.rendered = Kramdown::Document.new(self.body).to_html unless self.body.nil?
  end
end
