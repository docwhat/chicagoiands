require 'spec_helper'

describe "meetings page" do
  it "renders correctly with no meetings" do
    visit meetings_path
  end
end
