require 'spec_helper'

describe 'Exceptions' do
  it 'GET /meetings?season=9999999999999' do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get meetings_path, season: '9999999999999'
    expect(response.status).to be(200)
  end
end
