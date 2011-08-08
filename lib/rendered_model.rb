require 'active_record'
require 'kramdown'

# Pattern from http://railsforum.com/viewtopic.php?id=31510

module RenderedModel
  def self.included(base_class)
    base_class.class_eval do
      include RenderedModel::InstanceMethods

      before_save :render_body
    end
    #base_class.extend ClassMethods
  end

  #module ClassMethods
  #end

  module InstanceMethods

    ##
    # Updates the rendered field for the meeting.
    def render_body
      self.rendered = Kramdown::Document.new(self.body).to_html unless self.body.nil?
    end
  end
end
