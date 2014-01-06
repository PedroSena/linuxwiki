require 'spec_helper'

describe Command do
  it 'should create a valid command' do
    FactoryGirl.create(:command)
  end
  [:example, :title, :explanation, :user_id].each { |attr| it { should validate_presence_of attr } }
  it { should belong_to :user }
  it { should have_and_belong_to_many :votes }
end
