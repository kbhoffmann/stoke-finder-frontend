FactoryBot.define do
  activities = ['hiking', 'camping', 'biking', 'fishing', 'paragliding']
  factory :rec_area do
    factory :adventure do
      guest_email_addresses { Faker::Types.rb_array(len: 3) }
      date { Faker::Date.in_date_period(year: 2022, month: 2) }
      comment { Faker::Lorem.paragraph }
      activities {"Hiking, Fishing, Boating"}
      favorite { Faker::Boolean.boolean }
    end
  end
end
