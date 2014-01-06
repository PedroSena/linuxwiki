FactoryGirl.define do

  factory :user do
    provider 'Facebook'
    openID 'Uid'
    nickname 'Name'
    email 'email@example.com'
    oauth_token 'Token'
    oauth_expires_at 0
  end

end