require 'kramdown'

class Story < ActiveRecord::Base
  before_save :update_rendered

  def update_rendered
    self.rendered = Kramdown::Document.new(self.body).to_html
  end
end
