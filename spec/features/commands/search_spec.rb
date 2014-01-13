require 'spec_helper'

feature 'Searching for a command', js: true do

  given(:command) { FactoryGirl.create :command, explanation: 'This is my command explanation' }

  def search_for_command(command)
    visit '/'
    fill_in 'search', with: command.explanation
    click_button 'Search'
  end

  scenario 'Searching for a command that is not indexed(or does not exist) should not display content' do
    search_for_command command
    expect(page).to have_content 'No results were found'
  end

  scenario 'Searching for a command that is indexed should display its content' do
    commands = [command]
    allow(commands).to receive(:next_page)
    Command.should_receive(:search).and_return(commands)
    search_for_command command
    expect(page).to have_content command.example
  end

end