require 'active_record'
require 'redcarpet'

# Pattern from http://railsforum.com/viewtopic.php?id=31510

module RenderedModel
  def self.included(base_class)
    base_class.class_eval do
      include RenderedModel::InstanceMethods

      before_save :render_body
    end
    # base_class.extend ClassMethods
  end

  # module ClassMethods
  # end

  module InstanceMethods
    def markdown
      @markdown ||= Redcarpet::Markdown.new(
        Redcarpet::Render::SmartyHTML,
        autolink: true,
        no_intraemphasis: true,
        lax_html_blocks: true
      )
    end

    ##
    # Updates the rendered field for the meeting.
    def render_body
      self.rendered = markdown.render(body) unless body.nil?
    end

    def rendered
      read_attribute(:rendered).html_safe
    end
  end
end
