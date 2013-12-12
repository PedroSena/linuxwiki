FactoryGirl.define do

  factory :user do
    provider 'Facebook'
    uid 'Uid'
    name 'Name'
    email 'email@example.com'
    oauth_token 'Token'
    oauth_expires_at 0
  end

  factory :command do
    example { Faker::Lorem.sentence(7) }
    description { Faker::Lorem.paragraph(3) }
    user
  end
end