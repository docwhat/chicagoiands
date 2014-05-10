require 'spec_helper'

describe 'markdown help partial' do
  it 'renders correctly' do
    expect(render(partial: 'layouts/markdown_help'))
      .to match(/^\s*<section/)
  end
end
