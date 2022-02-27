require 'rails_helper'
RSpec.describe RidbFacade do
  it "calls poro to create activity poro" do
    WebMock.enable_net_connect!
    expect(RidbFacade.all_activities).to be_an(Array)
    expect(RidbFacade.all_activities.sample).to be_a(Activity)
  end
end