FactoryBot.define do
  activities = ['hiking', 'camping', 'biking', 'fishing', 'paragliding']
  factory :adventure do
    rec_area_id { Faker::Number.number(digits: 4) }
    guest_email_addresses { Faker::Types.rb_array(len: 3) }
    date { Faker::Date.in_date_period(year: 2022, month: 2) }
    comment { Faker::Lorem.paragraph }
    date_visited { Faker::Date.in_date_period(year: 2022, month: 2) }
    activities { activities[rand(0,4)] }
    favorite { Faker::Boolean.boolean }
  end
end
