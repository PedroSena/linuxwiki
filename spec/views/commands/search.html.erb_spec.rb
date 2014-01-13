require 'spec_helper'

describe 'commands/search.html.erb' do

   it 'displays the commands that satisfy the search' do
     commands = 5.times.map { FactoryGirl.create :command }
     allow(commands).to receive(:any?).and_return(true)
     allow(commands).to receive(:next_page)
     assign(:commands, commands)
     render

     expect(rendered).to have_selector('.example-wrapper', count: 5)
   end

end