require 'spec_helper'

describe 'commands/show.html.erb' do

  it 'displays an existing command but does not allow edit' do
    assign(:command, FactoryGirl.create(:command))
    view.stub(:current_user) { nil }
    render
    expect(rendered).to_not have_selector('input[type=submit]')
  end

end