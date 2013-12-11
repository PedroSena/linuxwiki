require 'spec_helper'

describe User do
  [:provider,:uid,:name, :email].each do |attribute|
    it { should validate_presence_of attribute }
  end

  it 'should save new user recently authenticated' do
    auth = double
    info = double
    credentials = double

    allow(info).to receive(:name).and_return 'Name'
    allow(info).to receive(:email).and_return 'sena.pedro@gmail.com'

    allow(credentials).to receive(:token).and_return 'Token'
    allow(credentials).to receive(:expires_at).and_return 0

    allow(auth).to receive(:provider).and_return 'Provider'
    allow(auth).to receive(:uid).and_return 'uid'
    allow(auth).to receive(:info).and_return info
    allow(auth).to receive(:credentials).and_return credentials
    allow(auth).to receive(:slice).and_return []

    expect {
      User.from_omniauth auth
    }.to change(User,:count).by 1
  end

  it 'should create a valid user' do
    FactoryGirl.create(:user)
  end
end
