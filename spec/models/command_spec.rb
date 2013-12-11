require 'spec_helper'

describe Command do
  it 'should create a valid command' do
    FactoryGirl.create :command
  end
  [:example,:votes].each do |attribute|
    it { should validate_presence_of attribute }
  end
  it { should validate_numericality_of(:votes).only_integer }
  it { should belong_to(:user) }

end
