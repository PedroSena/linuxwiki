require 'spec_helper'

describe Vote do
  it { should validate_presence_of :user_id }
  it { should validate_numericality_of :user_id }
  it { should belong_to :user }
end
