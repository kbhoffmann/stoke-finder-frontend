require 'rails_helper'
RSpec.describe RidbFacade do
  it "calls poro to create activity poro", :vcr do
    expect(RidbFacade.all_activities).to be_an(Array)
    expect(RidbFacade.all_activities.sample).to be_a(Activity)
  end

  it "calls poro to create a rec area poro by id", :vcr do
    rec_area_id = "284"
    expect(RidbFacade.get_rec_area_info_by_id(rec_area_id)).to be_a(RecArea)
  end

  it "calls poro to add activities by rec area ID", :vcr do
    rec_area_id = "284"
    expect(RidbFacade.get_activities_for_rec_area_by_id(rec_area_id)).to be_an(Array)
    expect(RidbFacade.get_activities_for_rec_area_by_id(rec_area_id).sample).to be_an(Activity)
  end
end
