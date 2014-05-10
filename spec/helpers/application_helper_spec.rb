require 'spec_helper'

describe ApplicationHelper do
  describe '#markdown_help_html' do
    it 'should return content' do
      markdown_help_html

      expect(markdown_help_html).to match(/\S+/)
    end
  end
end
