FactoryBot.define do
  # activities = ['hiking', 'camping', 'biking', 'fishing', 'paragliding']
  factory :user do
    user_name { Faker::DcComics.name }
    email { Faker::Internet.email }
    access { Faker::Number.number(digits: 1) }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip_code }
    # activity_preference activities[rand(0,4)]
  end
end
