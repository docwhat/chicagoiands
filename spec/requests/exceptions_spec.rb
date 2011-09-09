require 'spec_helper'

describe "Exceptions" do
  it "GET /meetings?season=9999999999999" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get meetings_path, :season => '9999999999999'
    response.status.should be(200)
  end
end
