require 'spec_helper'

describe Comment do
  [:content, :user_id, :command_id].each { |attr| it { should validate_presence_of attr } }
  [:user_id, :command_id].each { |attr| it { should validate_numericality_of attr } }
  [:user,:command].each { |owner| it { should belong_to owner } }
  it { should have_and_belong_to_many :votes }
end
