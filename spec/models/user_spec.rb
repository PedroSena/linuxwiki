require 'spec_helper'

describe User do
  it 'should create a valid user' do
    FactoryGirl.create(:user)
  end
  it 'should create a user from the authentication' do
    auth = Object.new
    allow(auth).to receive(:provider) { 'Facebook' }
    allow(auth).to receive(:uid) { 'uid' }
    allow(auth).to receive(:slice) { [] }
    info = Object.new
    allow(info).to receive(:name) { 'Pedro' }
    allow(info).to receive(:email) { 'test@email.com' }
    allow(auth).to receive(:info) { info }
    credentials = Object.new
    allow(credentials).to receive(:token) { 'Token' }
    allow(credentials).to receive(:expires_at) { 0 }
    allow(auth).to receive(:credentials) { credentials }

    expect(User.from_omniauth(auth)).to_not be_nil
  end
  [:provider, :uid, :nickname].each { |attr| it { should validate_presence_of attr } }
end
