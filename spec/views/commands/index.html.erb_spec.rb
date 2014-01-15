require 'spec_helper'

describe 'commands/index.html.erb' do

  before(:each) do
    [:search, :command].each do |model|
      assign(model.to_s.pluralize, 5.times.map { FactoryGirl.create model } )
    end
  end

  def assert_section_and_children(section_name, section_selector, children_selector = '.fa-ul li')
    render
    expect(rendered).to include section_name
    expect(rendered).to have_selector "#{section_selector}"
    expect(rendered).to have_selector "#{section_selector} #{children_selector}", count: 5
  end

  it 'displays the last 5 searches' do
    assert_section_and_children 'Latest Searches', '#section-latest-searches'
  end

  it 'displays the last 5 examples registered' do
    assert_section_and_children 'Latest Examples', '#section-latest-examples'
  end

end