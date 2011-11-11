require 'spec_helper'

describe ApplicationHelper do
  describe "#markdown_help_html" do
    it "should return content" do
      markdown_help_html
      markdown_help_html.should match /\S+/
    end
  end
end
