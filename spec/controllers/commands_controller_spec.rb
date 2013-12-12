require 'spec_helper'

describe CommandsController do

  describe 'POST' do
    it 'should create a valid command' do
      expect {
        post :create, format: :json, command: FactoryGirl.attributes_for(:command)
      }.to change(Command,:count).by 1
    end

    it 'should return error 400 if invalid command' do
      post :create, format: :json, command: FactoryGirl.attributes_for(:command, example: nil)
      expect(response.status).to eq 400
    end
  end
end
