FactoryGirl.define do

  factory :user do
    provider 'Facebook'
    uid 'Uid'
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    oauth_token 'Token'
    oauth_expires_at 0
  end

  factory :command do
    example { Faker::Lorem.sentence }
    explanation { Faker::Lorem.paragraph(1) }
    user
  end

end