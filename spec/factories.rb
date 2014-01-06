FactoryGirl.define do

  factory :user do
    provider 'Facebook'
    openID 'Uid'
    nickname 'Name'
    email 'email@example.com'
    oauth_token 'Token'
    oauth_expires_at 0
  end

  factory :command do
    example 'rm -rf $DIR/'
    title 'Removes directory recursively'
    explanation 'Removes the directory and all nested directories under it'
    user
  end

end