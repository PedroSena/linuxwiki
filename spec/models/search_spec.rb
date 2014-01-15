require 'spec_helper'

describe Search do
  it { should validate_presence_of :content }
  it 'retrieves the last 5 searches made, from the most recent to the less one' do
    searches = 10.times.map { sleep 0.1; FactoryGirl.create :search }
    expect(Search.last_five.load).to eq searches[5..10].reverse
  end
end
