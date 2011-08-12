module ApplicationHelper

  def markdown_help_html
    @markdown_help ||= (Rails.root + 'doc' + 'markdown.md').open('r') do |f|
      Kramdown::Document.new(f.read()).to_html.html_safe
    end
  end

end
