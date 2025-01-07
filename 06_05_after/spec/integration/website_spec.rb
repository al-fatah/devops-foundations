require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
include Capybara::DSL
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: 'http://selenium:4444/wd/hub',
    options: Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args = %w[
        --no-default-browser-check
        --disable-shm
        --no-sandbox
        --disable-gpu
        --window-size=1920x1080
      ]
    end
  )
end
Capybara.default_driver = :selenium # then tell Capybara which driver to use

describe "Real website" do
  it "Should be Explore California" do
    visit("http://localhost:8080")
    expect(page.title).to eq "Hello, and welcome to Explore California"
  end
end
