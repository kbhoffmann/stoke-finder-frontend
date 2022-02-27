require 'rails_helper'
RSpec.describe Activity do
  xit "turns parsed JSON into activity obj" do
    data = {:ActivityID=>4,
            :ActivityParentID=>0,
            :ActivityName=>"AUTO TOURING",
            :ActivityLevel=>0}
    activity_1 = Activity.new(data)
    expect(activity_1.name).to eq("AUTO TOURING")
    # expect(activity_1.id).to eq(4)
  end
end
