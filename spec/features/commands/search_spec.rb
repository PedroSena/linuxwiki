require 'spec_helper'

feature 'Searching for a command', js: true do

  given(:command) { FactoryGirl.create :command, explanation: 'This is my command explanation' }

  def search_for_command(command)
    visit '/'
    fill_in 'search', with: command.explanation
    click_button 'Search'
  end

  scenario 'Searching for a command that is not indexed(or does not exist) should not display content' do
    Command.should_receive(:search).and_return([])
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

  scenario 'Paginates in case of more than 5 results' do
    commands = 10.times.map { FactoryGirl.create :command }
    first_page = commands[0..4]
    second_page = commands[5..10]
    allow(first_page).to receive(:next_page).and_return(2)
    allow(second_page).to receive(:next_page).and_return(3)
    Command.should_receive(:search).and_return(first_page, second_page)
    search_for_command commands.first
    expect(page).to have_selector('.example-wrapper', count: 5)
    find('.load-more-commands').click
    expect(page).to have_selector('.example-wrapper', count: 10)
  end

end