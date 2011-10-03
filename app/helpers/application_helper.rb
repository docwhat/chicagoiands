module ApplicationHelper

  def markdown_help_html
    @markdown_help ||= (Rails.root + 'doc' + 'markdown.md').open('r') do |f|
      Redcarpet.new(f.read(), *MARKDOWN_OPTIONS).to_html.html_safe
    end
  end

end
