require 'spec_helper'

describe "markdown help partial" do

  it "renders correctly" do
    render(:partial => "layouts/markdown_help").should match /^\s*<section/
  end
end
