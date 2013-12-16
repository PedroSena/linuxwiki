require 'factory_girl'
require 'faker'

Dir[Rails.root.join('spec/factories.rb')].each { |f| require f }

100000.times do
  FactoryGirl.create(:command)
end