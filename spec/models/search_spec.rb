require 'spec_helper'

describe Search do
  it { should validate_presence_of :content }
  describe 'scope with_results' do
    it 'returns only commands with found_something set to true' do
      search_with_results = FactoryGirl.create(:search, found_something: true)
      FactoryGirl.create(:search, found_something: false)
      expect(Search.with_results.to_a).to eq [search_with_results]
      expect(Search.all.size).to eq 2
    end
  end
end
