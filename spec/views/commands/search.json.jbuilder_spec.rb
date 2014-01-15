require 'spec_helper'

describe 'commands/search.json.jbuilder' do

  it 'renders the commands as json' do
    commands = 5.times.map { FactoryGirl.create :command }
    assign(:commands, commands)
    render
    expect(rendered).to match(commands.first.example)
    expect(rendered).to match(commands.first.explanation)
    expect(rendered).to match(commands.first.creator)
  end
end