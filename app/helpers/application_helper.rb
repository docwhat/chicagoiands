module ApplicationHelper
  def markdown_help_html
    markdown ||= Redcarpet::Markdown.new(
      Redcarpet::Render::SmartyHTML,
      autolink: true,
      no_intraemphasis: true,
      lax_html_blocks: true
    )

    (Rails.root + 'doc' + 'markdown.md').open('r') do |f|
      markdown.render(f.read).html_safe
    end
  end
end
