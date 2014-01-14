require 'spec_helper'

feature 'Create a new command', js: true do
  it 'opens a dialog with options for authentication' do
    visit '/'
    click_button 'create_an_example_button'
    expect(page).to have_selector '.modal-title', visible: true
    expect(page).to have_selector '.list-inline li', count: 2
    social_authentication_options = %w(facebook twitter)
    social_authentication_options.each { |site| expect(page).to have_selector "a[href*=#{site}]" }
  end

  feature 'Creating a new command once you are logged in' do
    before(:each) do
      @user = FactoryGirl.create :user
      page.set_rack_session user_id: @user.id
    end
    it 'redirects to new commands page if user is authenticated' do
      visit '/'
      find('#create_an_example_button').click
      expect(current_path).to eq '/commands/new'
    end

    it 'creates a new command and displays it' do
      visit '/commands/new'
      example = 'Command Example'
      explanation = 'Command explanation'
      fill_in 'command[example]', with: example
      fill_in 'command[explanation]', with: explanation
      click_button 'Create example'
      sleep 0.5
      expect(current_path).to match /commands\/\d/
      expect(find('#command_example').value).to eq example
      expect(find('#command_explanation').text).to eq explanation
      expect(page).to have_content('Your example was successfully created')
    end
  end

end