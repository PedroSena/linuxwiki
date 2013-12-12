require 'spec_helper'

describe CommandsController do

  describe 'GET' do
    it 'should find at least one command' do
      5.times { FactoryGirl.create(:command) }
      command_to_search = Command.first
      Command.should_receive(:search).and_return([command_to_search])
      get :search, format: :json, search: command_to_search.example
      expect(response.status).to eq 200
      expect(response.body).to eq [command_to_search].to_json
    end

    it 'should return error 404 if no result is found' do
      Command.should_receive(:search).and_return []
      get :search, format: :json, search: 'Random String'
      expect(response.status).to eq 404
    end
  end

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

  describe 'PUT' do
    before(:each) do
      @command = FactoryGirl.create(:command)
    end
    it 'should update a command' do
      example = 'Another Example'
      put :update, format: :json, id: @command.id, command: FactoryGirl.attributes_for(:command, example: example)
      @command.reload
      expect(@command.example).to eq example
    end
    it 'should return an error for invalid commands' do
      put :update, format: :json, id: @command.id, command: FactoryGirl.attributes_for(:command, example: nil)
      expect(response.status).to eq 400
    end
  end
end
