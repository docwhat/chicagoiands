require 'kramdown'
require 'haml'

module Chicagoiands::Filters::Kramdown
  include Haml::Filters::Base

  def render(text)
    ::Kramdown::Document.new(text).to_html
  end
end
