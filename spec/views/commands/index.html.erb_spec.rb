require 'spec_helper'

describe 'commands/index.html.erb' do

  def assert_section_and_children(section_name, section_selector, children_selector = '.fa-ul li')
    expect(rendered).to include section_name
    expect(rendered).to have_selector "#{section_selector}"
    expect(rendered).to have_selector "#{section_selector} #{children_selector}", count: 5
  end

  it 'displays the last 5 searches' do
    render
    assert_section_and_children 'Latest Searches', '#section-latest-searches'
  end

  it 'displays the last 5 examples registered' do
    render
    assert_section_and_children 'Latest Examples', '#section-latest-examples'
  end

end