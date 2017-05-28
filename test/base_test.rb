require 'selenium-webdriver'
require 'minitest/autorun'
require 'minitest/reporters'

# Base class for UI tests.
class BaseTest < Minitest::Test
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  # @driver = Selenium::WebDriver.for :chrome,
  # desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
  #   'chromeOptions' => {
  #     'args' => %w[--disable-infobars --disable-web-security]
  #   }
  # )
  BROWSER = :chrome
  CAPS = Selenium::WebDriver::Remote::Capabilities.chrome(
    'chromeOptions' => {
      'args' => %w[--disable-infobars --disable-web-security]
    }
  )

  # Test environments
  HEROKU = 'https://id.heroku.com/login'.freeze
  THE_INTERNET = 'http://the-internet.herokuapp.com'.freeze
  GOOGLE = 'https://www.google.com'.freeze
  ENV['base_url'] = THE_INTERNET
end