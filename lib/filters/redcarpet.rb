require 'redcarpet'
require 'haml'

module Chicagoiands::Filters::Redcarpet
  include Haml::Filters::Base

  def render(text)
    ::Redcarpet.new(text, *MARKDOWN_OPTIONS.to_html
  end
end
