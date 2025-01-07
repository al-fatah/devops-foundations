require 'capybara'
require 'capybara/dsl'
include Capybara::DSL

describe 'Example page render unit tests' do
  it 'Should show the Explore California logo' do
    visit('http://localhost:8080')
    expect(page).to have_selector('a.logo')
  end
end
