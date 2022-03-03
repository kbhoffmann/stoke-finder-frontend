require 'rails_helper'
RSpec.describe Activity do
  it "turns parsed JSON into activity obj" do

    data = {:ActivityID=>4,
            :ActivityParentID=>0,
            :ActivityName=>"AUTO TOURING",
            :ActivityLevel=>0,
            :RecAreaActivityDescription => "Activity Description",
            :RecAreaID=>27,
            :RecAreaActivityFeeDescription => ""}

    activity_1 = Activity.new(data)

    expect(activity_1.name).to eq("AUTO TOURING")
    expect(activity_1.id).to eq(4)
    expect(activity_1.description).to eq("Activity Description")
    expect(activity_1.rec_area_id).to eq(27)
    expect(activity_1.fee).to eq("Information Not Available")
  end
end
