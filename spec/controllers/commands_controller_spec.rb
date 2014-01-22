require 'spec_helper'

describe CommandsController do

  describe 'GET' do
    it 'displays the index template' do
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:searches)).to eq Search.with_results.last(5).reverse
      expect(assigns(:commands)).to eq Command.last(5).reverse
    end

    it 'assigns @command' do
      session[:user_id] = 'Something'
      command = Command.new
      get :new
      expect(assigns(:command).id).to eq command.id
    end

    it 'redirects user back to root_url unless signed' do
      session[:user_id] = nil
      get :new
      expect(response.status).to eq 302
    end

    it 'searches for commands matching the string and creates a search with found_something set to true' do
      5.times { FactoryGirl.create(:command) }
      command_to_search = Command.first
      Command.should_receive(:search).and_return([command_to_search])
      expect {
        get :search, search: command_to_search.example
      }.to change(Search, :count).by 1
      expect(assigns(:commands)).to eq [command_to_search]
      expect(Search.last.found_something).to be true
    end

    it 'creates a search with found_something false if no result is found' do
      Command.should_receive(:search).and_return([])
      expect {
        get :search, search: 'nothing'
      }.to change(Search, :count).by 1
      expect(Search.last.found_something).to be false
    end
  end

  describe 'POST' do
    describe 'With logged user' do
      before(:each) do
        session[:user_id] = 'Something'
      end

      it 'creates a new command' do
        command = FactoryGirl.attributes_for :command
        expect {
          post :create, command: command
        }.to change(Command,:count).by 1
      end

      it 'returns error when trying to create invalid command' do
        command = FactoryGirl.attributes_for :command, example: nil
        post :create, command: command
        expect(response).to render_template(:new)
        expect(assigns(:command).errors).to_not be_nil
      end
    end

    it 'redirects the user and does not create the command unless logged' do
      expect {
        post :create, command: FactoryGirl.attributes_for(:command)
      }.to_not change(Command, :count).by 1
      expect(response).to redirect_to '/'
    end

  end

  describe 'PATCH' do
    it 'updates an existing command' do
      command = FactoryGirl.create :command
      new_example = 'Another example'
      patch :update, command: {example: new_example}, id: command.id
      command.reload
      expect(command.example).to eq new_example
      expect(response).to redirect_to action: :show
    end

    it 'returns to show view with error message in case of invalid update' do
      command = FactoryGirl.create :command
      patch :update, command: {example: nil}, id: command.id
      expect(command.example).to_not be_nil
      expect(assigns(:command).errors).to_not be_nil
    end
  end

end
