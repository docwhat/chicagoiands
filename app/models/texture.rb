require 'rendered_model'

class Texture < ActiveRecord::Base
  include RenderedModel

  validates :label, :presence => true, :uniqueness => true, :length => {:minimum => 2, :maximum => 20}
  validates :body,  :presence => true
end
